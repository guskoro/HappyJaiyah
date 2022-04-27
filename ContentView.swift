import SwiftUI
import AVFoundation
import AVKit

// Sound class
class SoundManger {
    private var player: AVAudioPlayer?
    
    // Play Sound Function
    func playSound(fileName: String) {
        // Check resource
        guard let url = Bundle.main.url(forResource: "\(fileName)", withExtension: ".m4a") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("Error playing sound. \(error.localizedDescription)")
        }
    }
}

struct ContentView: View {
    // Sound
    private var soundManager = SoundManger()
    // Score
    @State private var score = 0
    // Hijaiyah
    @State private var hijaiyahAnswer = ""
    @State var thisLetter = ""
    @State private var choiceHijaiyah : [String] = ["","","",""]
    // Hijaiyah Letter Collection
    @State private var hijaiyahLetter = ["Alif", "Ba", "Ta", "Tsa", "Jim", "Kha", "Kho", "Dal", "Dzal", "Ro", "Za", "Sin", "Syin", "Shod", "Dhod", "Tha", "Dzha", "Ain", "Ghain", "Fa", "Qaf", "Kaf", "Lam", "Mim", "Nun", "Wau", "Ha", "Lam Alif", "Hamzah", "Ya"]
    // Progress Bar
    @State var progressValue: Float = 0.0
    
    var body: some View {
        VStack {
            // Progress Bar
            ProgressBar(value: $progressValue).frame(height: 20)
            // Question image
            Image("\(thisLetter)")
                .resizable()
                .frame(width: 200.0, height: 200.0, alignment: .center)
            // Sound button
            Button {
                soundManager.playSound(fileName: thisLetter)
            } label: {
                Image(systemName: "speaker.wave.2")
                    .padding()
                    .background(.white)
                    .clipShape(Circle())
//                    .shadow(color: .gray, radius: 2)
            }
            // Instruction
            Text("Choose the answer")
                .font(.largeTitle)
                .bold()
            // Button Choices
            HStack {
                ForEach(0..<4) { index in
                    Button {
                        hijaiyahIsCorrect(answer: choiceHijaiyah[index])
                        generateAnswers()
                    } label: {
                        AnswerButtonHijaiyah(letter: choiceHijaiyah[index])
                    }
                }
            }
            // Updated Score
            Text("Score: \(score)")
                .font(.headline)
                .bold()
        }
        .padding()
        .onAppear(perform: generateAnswers)
    }
    
    // Below this are functions
    
    // Increament Bar
    func startProgressBar() {
        // Set only 14 to achieve learning goals
        for _ in 0...9 {
                self.progressValue += 0.01
            }
        }
    // Decreament Bar
    func resetProgressBar() {
            self.progressValue -= 0.01
        }
    // Checking correct Answer
    func hijaiyahIsCorrect(answer: String) {
        let isCorrect = answer == hijaiyahAnswer ? true : false
        // Updating Score and Progress Bar
        if isCorrect {
            self.startProgressBar()
            self.score += 1
        } else {
            self.resetProgressBar()
            self.score -= 1
        }
    }
    // Generating Answer from Random Letter
    func generateAnswers(){
        thisLetter = hijaiyahLetter.randomElement()!
        var hijaiyahList = [String]()
        
        hijaiyahAnswer = thisLetter
        // Randoming Choices
        for _ in 0...2 {
            hijaiyahList.append(hijaiyahLetter.randomElement()!)
        }
        hijaiyahList.append(hijaiyahAnswer) // Asign One Correct Answer on The Choices
        choiceHijaiyah = hijaiyahList.shuffled()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

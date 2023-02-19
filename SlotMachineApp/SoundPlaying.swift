import AVFoundation

var playAudio: AVAudioPlayer?
let audioEngine = AVAudioEngine()
let audioPlayerNode = AVAudioPlayerNode()


func soundPlaying(sound: String, type: String)
{
    if let path = Bundle.main.path(forResource: sound, ofType: type)
    {
        do
        {
            playAudio = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            playAudio?.play()
            playAudio?.volume = 0.5
        }
        catch
        {
            print("Error Playing Audio Sound!")
        }
    }
}



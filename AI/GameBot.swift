import Foundation

public struct Perceptron {
    let weights: [Double]
    let threshold: Double
    let bias: Double = -1.0

    public mutating func output(input: [Double]) -> Double {
        weightedSum(input: input) + bias > threshold ? 1.0 : 0.0
    }

    private mutating func weightedSum(input: [Double]) -> Double {
        assert(weights.count == input.count)
        var output: Double = 0.0
        for (weight, input) in zip(weights, input) {
            output += weight * input
        }
        return output
    }
}

extension GameScene {
    public func sum(
        _ input: [Double],
        _ weights1: inout [Double],
        _ weights2: inout [Double],
        _ learningRate: Double
    ) -> [Double] {

        var result: [Double] = [-1.0, -1.0]

        var neuron = Perceptron(weights: [weights1[0], weights1[1]], threshold: 133.0)

        let first = neuron.output(input: [input[0], input[1]])
        result[0] = first

        if input[1] > neuron.threshold {
            if first != 1.0 {
                let error: Double = 1.0 - first
                for i in 0 ..< weights1.count {
                    weights1[i] = weights1[i] + learningRate * error * input[1]
                }
                accList.append(0)
            } else {
                var neuron2 = Perceptron(weights: [weights2[0], weights2[1]], threshold: 266.0)

                let second = neuron2.output(input: [input[0], input[1]])

                result[1] = second

                if input[1] > neuron2.threshold {
                    if second != 1.0 {
                        let error2: Double = 1.0 - second
                        for i in 0 ..< weights2.count {
                            weights2[i] = weights2[i] + learningRate * error2 * input[1]
                        }
                        accList.append(0)
                    } else {
                        accList.append(1)
                    }
                } else {
                    if second != 0.0 {
                        let error2: Double = 0.0 - second
                        for i in 0 ..< weights2.count {
                            weights2[i] = weights2[i] + learningRate * error2 * input[1]
                        }
                        accList.append(0)
                    } else {
                        accList.append(1)
                    }
                }
            }
        } else {
            if first != 0.0 {
                let error: Double = 0.0 - first
                for i in 0 ..< weights1.count {
                    weights1[i] = weights1[i] + learningRate * error * input[1]
                }
                accList.append(0)
            } else {
                accList.append(1)
            }
        }
        return result
    }

//    public func startBot() {
//
//        var weights1 = [-0.4, 0.2]
//        var weights2 = [0.6, -0.8]
//        let learningRate = 0.02
//        let bias = -1.0
//
//        for _ in 0 ... 9999 {
//            let result = sum (
//                [bias, Double.random(in: 1 ... 400).rounded(.towardZero)],
//                &weights1,
//                &weights2,
//                learningRate
//            )
//        }
//    }

    func saveSetupWeights() {
        print("Saving")
        UserDefaults.standard.set(weights1[0], forKey: "weight10")
        UserDefaults.standard.set(weights1[1], forKey: "weight11")
        UserDefaults.standard.set(weights2[0], forKey: "weight20")
        UserDefaults.standard.set(weights2[1], forKey: "weight21")

    }
}


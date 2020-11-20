//
//  PlayDuelOfWords.swift
//  DuelOfWords
//
//  Created by Romhanyi Jozsef on 2020. 07. 30..
//  Copyright © 2020. Romhanyi Jozsef. All rights reserved.
//

//import UIKit
//import SceneKit
//import SpriteKit
//
//
//class PlayWithCubeOfWords: SCNScene {
//    public var sceneView: SCNView?
//    var cubeNode: SCNNode!
//    var cameraNode: SCNNode! {
//        willSet {
//            print("Camera position: \(newValue.position)")
//        }
//    }
//    var lightNode: SCNNode!
//    
//    var cubes: [[[SCNNode]]]!
//    let zCount = 5
//
//    override init() {
//        super.init()
//        GV.touchTarget = self
//        GV.touchSelector = #selector(touches)
//        createNew3DGameArray(size: GV.size)
////        fill3DGameArray()
////        for zIndex in 0..<GV.size {
////            for col in 0..<GV.size {
////                for row in 0..<GV.size {
////                    cubes[zIndex][col][row] = createCube(zIndex: zIndex, col: col, row: row)
////                }
////            }
////        }
//        let camera = SCNCamera()
//        camera.fieldOfView = 60
//        
//        let ambientLight = SCNLight()
//        ambientLight.type = SCNLight.LightType.ambient
//        ambientLight.color = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
//        
//        
//        self.cameraNode = SCNNode()
//        self.cameraNode.camera = camera
//        self.cameraNode.light = ambientLight
//        self.cameraNode.position = SCNVector3(x: 0, y: 10, z: (20 + Float(GV.size) * 2))
//        
//        let constraint = SCNLookAtConstraint(target: cubeNode)
//        constraint.isGimbalLockEnabled = true
//        cameraNode.constraints = [constraint]
//
//        
//        let omniLight = SCNLight()
//        omniLight.type = SCNLight.LightType.omni
//        
//        self.lightNode = SCNNode()
//        self.lightNode.light = omniLight
//        self.lightNode.position = SCNVector3(x: 0, y: 0, z: 0)
//        let lineSize: CGFloat = 0.1
//        let size: CGFloat = 50.0
//
//        let cameraConstraint = SCNLookAtConstraint(target: lightNode)
//        cameraConstraint.isGimbalLockEnabled = true
//        self.cameraNode.constraints = [cameraConstraint]
//        for z in 0..<GV.size {
//            for col in 0..<GV.size {
//                for row in 0..<GV.size {
//                    cubes[z][col][row] = createCube(zIndex: z, col: col, row: row)
//                    self.rootNode.addChildNode(cubes[z][col][row])
//                }
//            }
//        }
//        let YAxisGeometry1 = SCNBox(width: lineSize, height: size, length: lineSize, chamferRadius: 0.0)
//        let redMaterial = SCNMaterial()
//        redMaterial.diffuse.contents = UIColor.red // Y
//        YAxisGeometry1.materials = [redMaterial]
//        let YAxisNode = SCNNode(geometry: YAxisGeometry1)
//
//        let XAxisGeometry = SCNBox(width: size, height: lineSize, length: lineSize, chamferRadius: 0.0)
//        let greenMaterial = SCNMaterial()
//        greenMaterial.diffuse.contents = UIColor.green  // X
//        XAxisGeometry.materials = [greenMaterial]
//        let XAxisNode = SCNNode(geometry: XAxisGeometry)
//
//        let ZAxisGeometry = SCNBox(width: lineSize, height:lineSize, length: size, chamferRadius: 0.0)
//        let blueMaterial = SCNMaterial()
//        blueMaterial.diffuse.contents = UIColor.blue  // Z
//        ZAxisGeometry.materials = [blueMaterial]
//        let ZAxisNode = SCNNode(geometry: ZAxisGeometry)
//        
//
//        self.rootNode.addChildNode(cameraNode)
//        self.rootNode.addChildNode(lightNode)
////        self.rootNode.addChildNode(XAxisNode)
////        self.rootNode.addChildNode(YAxisNode)
////        self.rootNode.addChildNode(ZAxisNode)
////        self.rootNode.addChildNode(createStartingText())
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
//    
////    func registerGestureRecognizer() {
////        let tap = UITapGestureRecognizer(target: self, action: #selector(search))
////        self.sceneView!.addGestureRecognizer(tap)
//////        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(searchSwipe))
//////        self.sceneView!.addGestureRecognizer(swipe)
////
////    }
////
////
////    @objc func search(sender: UITapGestureRecognizer) {
////
////        let sceneView = sender.view as! SCNView
////        let location = sender.location(in: sceneView)
////        let results = sceneView.hitTest(location, options: [SCNHitTestOption.searchMode : 1])
////        if results.count > 0 {
////            guard sender.state == .ended else { return }
////                print("Touches: \(results[0].node.name)")
////                for result in results.filter( { $0.node.name == "Your node name" }) {
////                    // do manipulations
////            }
////        }
////    }
////
////    @objc func searchSwipe(sender: UISwipeGestureRecognizer) {
////
////        let sceneView = sender.view as! SCNView
////        let location = sender.location(in: sceneView)
////        let results = sceneView.hitTest(location, options: [SCNHitTestOption.searchMode : 1])
////        if results.count > 0 {
////            guard sender.state == .ended else { return }
////                print("Touches: \(results[0].node.name)")
////                for result in results.filter( { $0.node.name == "Your node name" }) {
////                    // do manipulations
////            }
////        }
////    }
//
//    private func createCube(zIndex: Int, col: Int, row: Int)->SCNNode {
//        let cubeSize: CGFloat = 2.5
//        let cube = SCNBox(width: cubeSize, height: cubeSize, length: cubeSize, chamferRadius: 0.25)
////        let cubeMaterial = SCNMaterial()
////        let myMaterial = SCNMaterial()
//        let cell = GV.gameArray3D[zIndex][col][row]
//        _ = cell.setLetter(letter: "A", toStatus: .GoldStatus)
//        let texture1 = SKView().texture(from: cell)
//        _ = cell.setLetter(letter: "B", toStatus: .DarkGoldStatus)
//        let texture2 = SKView().texture(from: cell)
//        _ = cell.setLetter(letter: "C", toStatus: .Temporary)
//        let texture3 = SKView().texture(from: cell)
//        _ = cell.setLetter(letter: "D", toStatus: .Error)
//        let texture4 = SKView().texture(from: cell)
//        _ = cell.setLetter(letter: "E", toStatus: .WholeWord)
//        let texture5 = SKView().texture(from: cell)
//        _ = cell.setLetter(letter: "F", toStatus: .FixItem)
//        let texture6 = SKView().texture(from: cell)
//        let cubeMaterial1: SCNMaterial?
//        let cubeMaterial2: SCNMaterial?
//        let cubeMaterial3: SCNMaterial?
//        let cubeMaterial4: SCNMaterial?
//        let cubeMaterial5: SCNMaterial?
//        let cubeMaterial6: SCNMaterial?
//        let a = SKLabelNode()
//        a.text = "A"
//        a.color = UIColor(red: 0, green: 0, blue: 1, alpha: 0.9)
//        cube.materials = [SCNMaterial(), SCNMaterial(), SCNMaterial(), SCNMaterial(), SCNMaterial(), SCNMaterial()]
//        if zIndex == 0 {
//            cubeMaterial1 = SCNMaterial()
//            cubeMaterial1!.diffuse.contents = texture1
//            cube.materials[0] = cubeMaterial1!
//        } else if zIndex == GV.size - 1 {
//            cubeMaterial6 = SCNMaterial()
//            cubeMaterial6!.diffuse.contents = texture6
//            cube.materials[5] = cubeMaterial6!
//        }
////        if col == 0 {
////            cubeMaterial2 = SCNMaterial()
////            cubeMaterial2!.diffuse.contents = texture2
////            cube.materials[1] = cubeMaterial2!
////        } else if col == GV.size - 1 {
////            cubeMaterial5 = SCNMaterial()
////            cubeMaterial5!.diffuse.contents = texture5
////            cube.materials[4] = cubeMaterial5!
////        }
////        if row == 0 {
////            cubeMaterial3 = SCNMaterial()
////            cubeMaterial3!.diffuse.contents = texture3
////            cube.materials[2] = cubeMaterial3!
////        } else if row == GV.size - 1 {
////            cubeMaterial4 = SCNMaterial()
////            cubeMaterial4!.diffuse.contents = texture4
////            cube.materials[4] = cubeMaterial4!
////        }
////        myMaterial.diffuse.contents = texture1//UIColor.green //Upper
//        let cubeNode = SCNNode(geometry: cube)
////        self.cubeNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 0.00, y: 0.00, z: 0.00, duration: 5.0/60.0)))
//        let cubMultiplier = CGFloat(cubeSize - 0.6)
//        cubeNode.position = SCNVector3(CGFloat(zIndex - GV.size/2) * cubMultiplier, CGFloat(col - GV.size/2) * cubMultiplier, CGFloat(row) * cubMultiplier)
//        cubeNode.name = "Cell\(col)-\(row)"
//        return cubeNode
//    }
//    
//    public func start() {
////        registerGestureRecognizer()
//    }
//    let countCubeSides = 6
//    
//    private func fill3DGameArray() {
//        let primary = GV.actLanguage + GV.innerSeparator + "*" + GV.innerSeparator + String(GV.size)
//        let origGames = gamesRealm.objects(Games.self).filter("primary like %@", primary).sorted(byKeyPath: "gameNumber")
//        if origGames.count > 0 {
//            for (gameIndex, game) in origGames.enumerated() {
//                if gameIndex == countCubeSides {
//                    break
//                }
//                print("GameNumber: \(game.gameNumber)")
//                for (index, letter) in game.gameArray.enumerated() {
//                    let col = index / GV.size
//                    let row = index % GV.size
////                    GV._3DGameArray[col][row][gameIndex].position = toGrid.gridPosition(col: col, row: row)
//                    GV.gameArray3D[gameIndex][col][row].name = "GBD/\(col)/\(row)/\(gameIndex)"
//                    GV.gameArray3D[gameIndex][col][row].col = col
//                    GV.gameArray3D[gameIndex][col][row].row = row
//                    _ = GV.gameArray3D[gameIndex][col][row].setLetter(letter: String(letter), toStatus: .Used, fontSize: GV.blockSize * 0.6)
////                    toGrid.addChild(gameArray[col][row])
//                }
//            }
//        }
//    }
//    
//    private func createNew3DGameArray(size: Int){
//        var gameArray3D: [[[GameboardItem]]] = []
//        var cubes3D: [[[SCNNode]]] = []
//        
//        for zValue in 0..<size {
//            gameArray3D.append( [[GameboardItem]]() )
//            cubes3D.append([[SCNNode]]())
//            
//            for col in 0..<size {
//                gameArray3D[zValue].append( [GameboardItem]())
//                cubes3D[zValue].append([SCNNode]())
//                for row in 0..<size {
//                    gameArray3D[zValue][col].append( GameboardItem() )
//                    cubes3D[zValue][col].append(SCNNode())
//                    gameArray3D[zValue][col][row].letter = emptyLetter
//                }
//            }
//        }
//        GV.gameArray3D = gameArray3D
//        cubes = cubes3D
//    }
//
//    
//    @objc public func touches() {
//        switch GV.touchType {
//        case .Began: touchesBegan(touches: GV.touchParam1, with: GV.touchParam2)
//        case .Moved: touchesMoved(touches: GV.touchParam1, with: GV.touchParam2)
//        case .Ended: touchesEnded(touches: GV.touchParam1, with: GV.touchParam2)
//        case .none:
//            break
//        }
//    }
//    
//    var startLocation = CGPoint()
//    var choosedWord = UsedWord()
//    
//    private func touchesBegan(touches: Set<UITouch>, with event: UIEvent?) {
//        choosedWord = UsedWord()
//        let touchLocation = touches.first!.location(in: self.sceneView)
//        startLocation = touchLocation
////        let (_, row) = analyseLocation(location: touchLocation)
//    }
//    
//    private func touchesMoved(touches: Set<UITouch>, with event: UIEvent?) {
//        let touchLocation = touches.first!.location(in: self.sceneView)
//        let (col, row) = analyseLocation(location: touchLocation)
//        if col != nil && row != nil {
//            let cell = GV.gameArray[col!][row!]
//            let usedLetter = UsedLetter(col: col!, row: row!, letter: cell.letter)
//            if choosedWord.usedLetters.count == 0 || choosedWord.usedLetters.last! != usedLetter {
//                choosedWord.append(usedLetter)
////                print("choosedWord: \(choosedWord.word)")
//            }
//        }
//        
//    }
//    
//    private func touchesEnded(touches: Set<UITouch>, with event: UIEvent?) {
//        let touchLocation = touches.first!.location(in: self.sceneView)
//        if choosedWord.count > 3 {
//            let foundedWords = newWordListRealm.objects(NewWordListModel.self).filter("word = %@", GV.actLanguage + choosedWord.word.lowercased())
//            if foundedWords.count == 1 {
//                print(choosedWord.word)
////                if saveChoosedWord() {
////                    animateLetters(choosedWord, type: .WordIsOK)
////                    mySounds.play(.OKWord)
////                    setGameArrayToActualState()
////                } else {
////                    animateLetters(choosedWord, type: .WordIsActiv)
////                    clearTemporaryCells()
////                    mySounds.play(.NoSuchWord)
////                }
//            } else {
////                clearTemporaryCells()
////                animateLetters(choosedWord, type: .NoSuchWord)
////                mySounds.play(.NoSuchWord)
//            }
//            choosedWord = UsedWord()
//        } else {
////            clearTemporaryCells()
//        }
//
//    }
//    
//    private func analyseLocation(location: CGPoint)->(col: Int?, row: Int?) {
//    
//        let results = sceneView!.hitTest(location, options: [SCNHitTestOption.searchMode : 1])
//        if results.count == 0 {
//            return (nil, nil)
//        }
//        for result in results {
//            if result.node.name != nil {
//                let col = Int(result.node.name!.char(at: 4))
//                let row = Int(result.node.name!.char(at: 6))
//                return (col, row)
//            }
//        }
//        return (nil, nil)
//    }
//
//    
//}
//
//

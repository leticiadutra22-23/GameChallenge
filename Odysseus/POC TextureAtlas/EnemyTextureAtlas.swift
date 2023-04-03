//
//  EnemyTextureAtlas.swift
//  Odysseus
//
//  Created by Emilly Maia on 03/04/23.
//

import SpriteKit

var enemyAtlas: SKTextureAtlas = SKTextureAtlas(named: "Enemy")
var enemyAnimation = SKAction()

let enemyFrames: [SKTexture] =
    [enemyAtlas.textureNamed("enemy1"),
     enemyAtlas.textureNamed("enemy2")]



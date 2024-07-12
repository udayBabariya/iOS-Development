//
//  Facade.swift
//  DesignPatterns
//
//  Created by Uday on 11/07/24.
//

import Foundation

//The Facade Design Pattern provides a simplified interface to a complex subsystem, making it easier to use. It hides the complexities of the subsystem by providing a higher-level interface.

//This pattern is useful when you have to replace, for example, Alamofire with NSURLSession. You should make a change only in your Facade class without editing its interface.

//Later, I can replace it with something else and I won’t have to make changes in all the places where it was used. It ill be enough to edit only one class


//Subsystem Classes:
class DVDPlayer {
    func on() {
        print("DVD Player is on")
    }
    func play(movie: String) {
        print("Playing \(movie)")
    }
    func stop() {
        print("Stopping DVD Player")
    }
    func off() {
        print("DVD Player is off")
    }
}

class Projector {
    func on() {
        print("Projector is on")
    }
    func off() {
        print("Projector is off")
    }
    func wideScreenMode() {
        print("Projector in widescreen mode")
    }
}

class SoundSystem {
    func on() {
        print("Sound System is on")
    }
    func off() {
        print("Sound System is off")
    }
    func setVolume(level: Int) {
        print("Sound System volume set to \(level)")
    }
}

class Lights {
    func dim(level: Int) {
        print("Lights dimmed to \(level)%")
    }
    func on() {
        print("Lights are on")
    }
}

//Facade Class:
class HomeTheaterFacade {
    private let dvdPlayer: DVDPlayer
    private let projector: Projector
    private let soundSystem: SoundSystem
    private let lights: Lights

    init(dvdPlayer: DVDPlayer, projector: Projector, soundSystem: SoundSystem, lights: Lights) {
        self.dvdPlayer = dvdPlayer
        self.projector = projector
        self.soundSystem = soundSystem
        self.lights = lights
    }

    func watchMovie(movie: String) {
        print("Get ready to watch a movie...")
        lights.dim(level: 10)
        projector.on()
        projector.wideScreenMode()
        soundSystem.on()
        soundSystem.setVolume(level: 5)
        dvdPlayer.on()
        dvdPlayer.play(movie: movie)
    }

    func endMovie() {
        print("Shutting movie theater down...")
        lights.on()
        projector.off()
        soundSystem.off()
        dvdPlayer.stop()
        dvdPlayer.off()
    }
}


//Usage

private func usage() {
    let dvdPlayer = DVDPlayer()
    let projector = Projector()
    let soundSystem = SoundSystem()
    let lights = Lights()

    let homeTheater = HomeTheaterFacade(dvdPlayer: dvdPlayer, projector: projector, soundSystem: soundSystem, lights: lights)

    homeTheater.watchMovie(movie: "Inception")
    // Output:
    // Get ready to watch a movie...
    // Lights dimmed to 10%
    // Projector is on
    // Projector in widescreen mode
    // Sound System is on
    // Sound System volume set to 5
    // DVD Player is on
    // Playing Inception

    homeTheater.endMovie()
    // Output:
    // Shutting movie theater down...
    // Lights are on
    // Projector is off
    // Sound System is off
    // Stopping DVD Player
    // DVD Player is off
}


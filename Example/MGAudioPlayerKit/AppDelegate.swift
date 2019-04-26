//
//  AppDelegate.swift
//  MGAudioPlayerKit
//
//  Created by AldoOS on 03/30/2019.
//  Copyright (c) 2019 AldoOS. All rights reserved.
//

import UIKit
import MGAudioPlayerKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, MGAudioPlayerControllerDelegate, MGAudioPlayerControllerDataSource {
    var window: UIWindow?
    var audioPlayerController: MGAudioPlayerListController!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        audioPlayerController = MGAudioPlayerListController.instance
        audioPlayerController.delegate = self
        audioPlayerController.dataSource = self
        audioPlayerController.assets = AudioPlayerAsset(
            string: AudioPlayerString(
                title: "Audio Player",
                navigationBarTitle: "Audio Player",
                searchBarPlaceholder: "Search",
                navigationListPlayerPrompt: nil,
                navigationAudioPlayerPrompt: nil),
            font: AudioPlayerFont(
                tableViewCellTitle: nil,
                tableViewCellDescription: nil,
                tableViewCellSubtitle: nil,
                tableViewCellRating: nil,
                detailTitle: nil,
                detailDescription: nil,
                detailSubtitle: nil,
                detailRating: nil,
                actorListFullname: nil,
                actorListRolename: nil,
                playerTitle: nil,
                playerSubtitle: nil,
                playerYearPub: nil),
            image: AudioPlayerImage(
                likeNormal: #imageLiteral(resourceName: "menu") ,
                likeSelected: #imageLiteral(resourceName: "menu"),
                likeHighlighted: #imageLiteral(resourceName: "menu"),
                shareNormal: #imageLiteral(resourceName: "menu"),
                tableViewCellIcon: #imageLiteral(resourceName: "menu"),
                play: #imageLiteral(resourceName: "menu"),
                pause: #imageLiteral(resourceName: "menu"),
                thumbNormal: #imageLiteral(resourceName: "menu"),
                thumbSelected: #imageLiteral(resourceName: "menu"),
                stepForward: #imageLiteral(resourceName: "menu"),
                stepBackward: #imageLiteral(resourceName: "menu"),
                shuffleActive: #imageLiteral(resourceName: "menu"),
                shuffleUnactive: #imageLiteral(resourceName: "menu"),
                repeatActive: #imageLiteral(resourceName: "menu"),
                repeatUnactive: #imageLiteral(resourceName: "menu"),
                heartActive: #imageLiteral(resourceName: "menu"),
                heartUnactive: #imageLiteral(resourceName: "menu"),
                option: #imageLiteral(resourceName: "menu"),
                share: #imageLiteral(resourceName: "menu")),
            color: AudioPlayerColor(
                navigationBar: .black,
                navigationBarContent: .white,
                toolBar: .black,
                toolBarContent: .white,
                view: .black,
                viewContent: .white,
                tableView: .black,
                tableViewSeparator: .white,
                refresh: .white,
                searchBarContent: .white,
                tableViewCell: .black,
                tableViewCellContent: .white,
                collectionView: .black,
                collectionViewContent: .white,
                sliderMinimumTrackColor: .red,
                playerTitle: .red,
                playerSubtitle: .red,
                playerYearPub: .red,
                timeProgress: .red),
            data: AudioPlayerData(
                items: AudioData.items,
                darkKeyboard: true,
                bundle: .main))

        window?.rootViewController = UINavigationController(rootViewController: audioPlayerController)
        window?.makeKeyAndVisible()
        return true
    }

    func controller(_ controller: UIViewController, didTapBarButtonItem barButtonItem: UIBarButtonItem) {
        
    }
    
    func controller(_ controller: UIViewController, didTapButton button: UIButton) {
        //        let alertController = UIAlertController(title: "mg.audioplayer.btm.option.sheet.title".localized, message: "mg.audioplayer.btm.option.sheet.description".localized, preferredStyle: .actionSheet)
        //        alertController.addAction(UIAlertAction(title: "mg.audioplayer.btm.option.sheet.opton.one".localized, style: .default, handler: { (action) in
        //        }))
        //        alertController.addAction(UIAlertAction(title: "mg.audioplayer.btm.option.sheet.opton.two".localized, style: .default, handler: { (action) in
        //        }))
        //        alertController.addAction(UIAlertAction(title: "mg.audioplayer.btm.option.sheet.opton.three".localized, style: .default, handler: { (action) in
        //        }))
        //        alertController.addAction(UIAlertAction(title: "mg.audioplayer.btm.option.sheet.opton.cancel".localized, style: .cancel, handler: { (action) in
        //        }))
        //        present(alertController, animated: true) { }
    }
    
    func leftBarButtonItems(_ controller: UIViewController) -> [UIBarButtonItem] {
        if controller is MGAudioPlayerListController {
            let menuBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: nil, action: nil)
            menuBarButtonItem.style = .plain
            menuBarButtonItem.accessibilityIdentifier = "MENU"
            return [menuBarButtonItem]
        }
        let menuBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: nil, action: nil)
        menuBarButtonItem.style = .plain
        menuBarButtonItem.accessibilityIdentifier = "MENU"
        return [menuBarButtonItem]
    }
    
    func rightBarButtonItems(_ controller: UIViewController) -> [UIBarButtonItem] {
        if controller is MGAudioPlayerListController {
            let shareBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: nil)
            shareBarButtonItem.style = .plain
            shareBarButtonItem.accessibilityIdentifier = "SHARE"
            return [shareBarButtonItem]
        }
        let shareBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: nil)
        shareBarButtonItem.style = .plain
        shareBarButtonItem.accessibilityIdentifier = "SHARE"
        return [shareBarButtonItem]
    }

}

struct AudioPlayerAsset: MGAudioPlayerAsset {
    var string: MGAudioPlayerString
    var font: MGAudioPlayerFont
    var image: MGAudioPlayerImage
    var color: MGAudioPlayerColor
    var data: MGAudioPlayerData
}

struct AudioPlayerString: MGAudioPlayerString {
    var title: String
    var navigationBarTitle: String
    var searchBarPlaceholder: String
    var navigationListPlayerPrompt: String?
    var navigationAudioPlayerPrompt: String?
}

struct AudioPlayerFont: MGAudioPlayerFont {
    var tableViewCellTitle: UIFont?
    var tableViewCellDescription: UIFont?
    var tableViewCellSubtitle: UIFont?
    var tableViewCellRating: UIFont?
    var detailTitle: UIFont?
    var detailDescription: UIFont?
    var detailSubtitle: UIFont?
    var detailRating: UIFont?
    var actorListFullname: UIFont?
    var actorListRolename: UIFont?
    var playerTitle: UIFont?
    var playerSubtitle: UIFont?
    var playerYearPub: UIFont?
}

struct AudioPlayerImage: MGAudioPlayerImage {
    var likeNormal: UIImage
    var likeSelected: UIImage
    var likeHighlighted: UIImage
    var shareNormal: UIImage
    var tableViewCellIcon: UIImage
    var play: UIImage
    var pause: UIImage
    var thumbNormal: UIImage
    var thumbSelected: UIImage
    var stepForward: UIImage
    var stepBackward: UIImage
    var shuffleActive: UIImage
    var shuffleUnactive: UIImage
    var repeatActive: UIImage
    var repeatUnactive: UIImage
    var heartActive: UIImage
    var heartUnactive: UIImage
    var option: UIImage
    var share: UIImage
}

struct AudioPlayerColor: MGAudioPlayerColor {
    var navigationBar: UIColor
    var navigationBarContent: UIColor
    var toolBar: UIColor
    var toolBarContent: UIColor
    var view: UIColor
    var viewContent: UIColor
    var tableView: UIColor
    var tableViewSeparator: UIColor
    var refresh: UIColor
    var searchBarContent: UIColor
    var tableViewCell: UIColor
    var tableViewCellContent: UIColor
    var collectionView: UIColor
    var collectionViewContent: UIColor
    var sliderMinimumTrackColor: UIColor
    var playerTitle: UIColor
    var playerSubtitle: UIColor
    var playerYearPub: UIColor
    var timeProgress: UIColor
}

struct AudioPlayerData: MGAudioPlayerData {
    var items: [MGAudioPlayerItem]?
    var darkKeyboard: Bool
    var bundle: Bundle
}

public class AudioData {
    static var items:[MGAudioPlayerItem] {
        var audios = [MGAudioPlayerItem]()
        
        let audio4 = MGAudioPlayerItem()
        audio4.title = "Shoot To Trill"
        audio4.author = "AC/DC"
        audio4.pubYear = "2019"
        audio4.thumbUrlString = "https://img.discogs.com/qezpe-mrKMTlnUJimUtnFEPwD5A=/fit-in/600x600/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/R-2829666-1302947530.jpeg.jpg"
        audio4.filename = "shoottothrill"
        audio4.filetype = "mp3"
        audios.append(audio4)
        
        let audio9 = MGAudioPlayerItem()
        audio9.title = "Thunderstruck"
        audio9.author = "AC/DC"
        audio9.pubYear = "2019"
        audio9.thumbUrlString = "https://townsquare.media/site/295/files/2016/04/ACDC.jpg"
        audio9.filename = "thunderstruck"
        audio9.filetype = "mp3"
        audios.append(audio9)
        
        let audio6 = MGAudioPlayerItem()
        audio6.title = "Levels"
        audio6.author = "AVICII"
        audio6.pubYear = "2019"
        audio6.thumbUrlString = "https://static.euronews.com/articles/stories/03/13/35/68/880x495_cmsv2_9f70e6ba-0504-5dbd-b227-2ae9e3f81bee-3133568.jpg"
        audio6.filename = "aviciilevels"
        audio6.filetype = "mp3"
        audios.append(audio6)
        
        let audio7 = MGAudioPlayerItem()
        audio7.title = "Wake Me Up"
        audio7.author = "AVICII"
        audio7.pubYear = "2019"
        audio7.thumbUrlString = "https://img.cache.vevo.com/thumb/cms/64ebe7c3e85cbf64cba44d581f60c2bf201536132118366.jpg"
        audio7.filename = "aviciiwakemeup"
        audio7.filetype = "mp3"
        audios.append(audio7)
        
        let audio0 = MGAudioPlayerItem()
        audio0.title = "The Rains of Castamere"
        audio0.author = "Arctic Monkeys"
        audio0.pubYear = "2019"
        audio0.thumbUrlString = "https://testitradotti.wikitesti.com/wp-content/uploads/2015/08/the-rains-of-castamere-traduzion.jpg"
        audio0.filename = "therainsofcastamere"
        audio0.filetype = "mp3"
        audios.append(audio0)
        
        let audio1 = MGAudioPlayerItem()
        audio1.title = "Zombie"
        audio1.author = "Bad Wolves"
        audio1.pubYear = "2019"
        audio1.thumbUrlString = "https://junkee.com/wp-content/uploads/2017/07/chester-brighter.jpg"
        audio1.filename = "zombiebadwolves"
        audio1.filetype = "mp3"
        audios.append(audio1)
        
        let audio2 = MGAudioPlayerItem()
        audio2.title = "Twenty One Pilots"
        audio2.author = "Chlorine"
        audio2.pubYear = "2019"
        audio2.thumbUrlString = "https://images.genius.com/ba602b559ff37ab14df0860b5a898436.1000x1000x1.jpg"
        audio2.filename = "twentyonepilots"
        audio2.filetype = "mp3"
        audios.append(audio2)
        
        let audio3 = MGAudioPlayerItem()
        audio3.title = "Bad Liar"
        audio3.author = "Imagine Dragons"
        audio3.pubYear = "2019"
        audio3.thumbUrlString = "https://upload.wikimedia.org/wikipedia/en/thumb/6/66/Imagine_Dragons_Bad_Liar.jpg/220px-Imagine_Dragons_Bad_Liar.jpg"
        audio3.filename = "badliar"
        audio3.filetype = "mp3"
        audios.append(audio3)
        
        let audio5 = MGAudioPlayerItem()
        audio5.title = "Try"
        audio5.author = "PINK"
        audio5.pubYear = "2019"
        audio5.thumbUrlString = "https://akns-images.eonline.com/eol_images/Entire_Site/2018711/rs_600x600-180811082229-600-pink.cm.81118.jpg"
        audio5.filename = "pinktry"
        audio5.filetype = "mp3"
        audios.append(audio5)
        
        let audio8 = MGAudioPlayerItem()
        audio8.title = "Numb"
        audio8.author = "Linkin Park"
        audio8.pubYear = "2019"
        audio8.thumbUrlString = "https://i.ytimg.com/vi/9XaS93WMRQQ/maxresdefault.jpg"
        audio8.filename = "linkinparknumb"
        audio8.filetype = "mp3"
        audios.append(audio8)
        
        return audios
    }
    
}

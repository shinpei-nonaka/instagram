//
//  CommentViewController.swift
//  Instagram
//
//  Created by PC-SYSKAI556 on 2022/10/25.
//

import UIKit
import Firebase
import SVProgressHUD

class CommentViewController: UIViewController {

    var postData: PostData!
    @IBOutlet weak var commentText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // 投稿ボタンをタップしたときに呼ばれるメソッド
    @IBAction func handlePostButton3(_ sender: Any) {

        // 画像と投稿データの保存場所を定義する
        let postRef = Firestore.firestore().collection(Const.PostPath).document(postData.id)

        // HUDで投稿処理中の表示を開始
        SVProgressHUD.show()
        
        

        // FireStoreに投稿データを保存する
        let name = Auth.auth().currentUser?.displayName
        postRef.updateData([
          "comment": FieldValue.arrayUnion([name! + ": " + self.commentText.text!])
        ])

        // HUDで投稿完了を表示する
        SVProgressHUD.showSuccess(withStatus: "投稿しました")
        // 投稿処理が完了したので先頭画面に戻る
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }


    // キャンセルボタンをタップしたときに呼ばれるメソッド
    @IBAction func handleCancelButton2(_ sender: Any) {
        // 加工画面に戻る
        self.dismiss(animated: true, completion: nil)
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

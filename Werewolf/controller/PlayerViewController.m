//
//  PlayerViewController.m
//  Werewolf
//
//  Created by semler on 14-12-3.
//  Copyright (c) 2014年 semler. All rights reserved.
//

#import "PlayerViewController.h"
#import "PlayerManager.h"
#import "Player.h"
#import "GameStatus.h"

@interface PlayerViewController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
//@property (weak, nonatomic) IBOutlet UITextField *name;

- (IBAction)callCamera:(id)sender;
- (IBAction)callLibrary:(id)sender;
- (IBAction)okButtonPressed:(id)sender;
- (IBAction)cacelButtonPressed:(id)sender;

@end

@implementation PlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)callCamera:(id)sender {
    // カメラ起動
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    if ([UIImagePickerController isSourceTypeAvailable:sourceType]) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.sourceType = sourceType;
        picker.delegate = self;
        [self presentViewController:picker animated:YES completion:NULL];
    }
}

- (IBAction)callLibrary:(id)sender {
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    if ([UIImagePickerController isSourceTypeAvailable:sourceType]) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.sourceType = sourceType;
        picker.delegate = self;
        [self presentViewController:picker animated:YES completion:NULL];
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    [self dismissViewControllerAnimated:YES completion:^{
        self.imageView.image = image;
    }];
}

- (IBAction)okButtonPressed:(id)sender {
    NSString *fileName;
    
    Player *player = [[Player alloc] init];
    player.image = self.imageView.image;
    
    if ([GameStatus sharedManager].currentPlayerInt == 1) {
        fileName = @"player1.jpg";
        [PlayerManager sharedManager].player1 = player;
    } else if ([GameStatus sharedManager].currentPlayerInt == 2) {
        fileName = @"player2.jpg";
        [PlayerManager sharedManager].player2 = player;
    } else if ([GameStatus sharedManager].currentPlayerInt == 3) {
        fileName = @"player3.jpg";
        [PlayerManager sharedManager].player3 = player;
    } else if ([GameStatus sharedManager].currentPlayerInt == 4) {
        fileName = @"player4.jpg";
        [PlayerManager sharedManager].player4 = player;
    } else if ([GameStatus sharedManager].currentPlayerInt == 5) {
        fileName = @"player5.jpg";
        [PlayerManager sharedManager].player5 = player;
    } else if ([GameStatus sharedManager].currentPlayerInt == 6) {
        fileName = @"player6.jpg";
        [PlayerManager sharedManager].player6 = player;
    } else if ([GameStatus sharedManager].currentPlayerInt == 7) {
        fileName = @"player7.jpg";
        [PlayerManager sharedManager].player7 = player;
    } else if ([GameStatus sharedManager].currentPlayerInt == 8) {
        fileName = @"player8.jpg";
        [PlayerManager sharedManager].player8 = player;
    } else if ([GameStatus sharedManager].currentPlayerInt == 9) {
        fileName = @"player9.jpg";
        [PlayerManager sharedManager].player9 = player;
    } else if ([GameStatus sharedManager].currentPlayerInt == 10) {
        fileName = @"player10.jpg";
        [PlayerManager sharedManager].player10 = player;
    } else if ([GameStatus sharedManager].currentPlayerInt == 11) {
        fileName = @"player11.jpg";
        [PlayerManager sharedManager].player11 = player;
    }
    
    // 写真の保存
    // JPEGのデータとしてNSDataを作成します
    // ここのUIImageJPEGRepresentationがミソです
    NSData *data = UIImageJPEGRepresentation(self.imageView.image, 0.8f);
    
    // 保存するディレクトリを指定します
    // ここではデータを保存する為に一般的に使われるDocumentsディレクトリ
    NSString *path = [NSString stringWithFormat:@"%@/%@", [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"], fileName];
    
    
    // NSDataのwriteToFileメソッドを使ってファイルに書き込みます
    // atomically=YESの場合、同名のファイルがあったら、まずは別名で作成して、その後、ファイルの上書きを行います
    if ([data writeToFile:path atomically:YES]) {
        NSLog(@"save OK");
    } else {
        NSLog(@"save NG");
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cacelButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end

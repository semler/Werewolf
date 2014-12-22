//
//  AlermViewController.m
//  Werewolf
//
//  Created by semler on 2014/12/16.
//  Copyright (c) 2014年 semler. All rights reserved.
//

#import "AlermViewController.h"
#import <AVFoundation/AVAudioPlayer.h>

@interface AlermViewController () <UIPickerViewDelegate, AVAudioPlayerDelegate>

@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UILabel *minute;
@property (weak, nonatomic) IBOutlet UILabel *second;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (strong, nonatomic) NSMutableArray *array;
@property (nonatomic) int discussTime;
//アラーム音声格納用
@property (strong, nonatomic) NSString *alarmSound;
@property (nonatomic,strong) AVAudioPlayer *player;
@property (nonatomic) BOOL pickFlg;

- (IBAction)startButtonPressed:(id)sender;
- (IBAction)endButtonPressed:(id)sender;

@end

@implementation AlermViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.array = [NSMutableArray arrayWithObjects:@"５分", @"３分", @"１分", nil];
    self.discussTime = 300;
    self.pickFlg = NO;
    // デリゲートを設定
    self.pickerView.delegate = self;
    // 選択インジケータを表示
    self.pickerView.showsSelectionIndicator = YES;
    
    //アラーム用のサウンドを読み込む
    self.alarmSound = [[NSBundle mainBundle] pathForResource:@"koukaon1" ofType:@"wav"];
}
    
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)endButtonPressed:(id)sender {
    [self.player stop];
    [self dismissViewControllerAnimated:YES completion:nil];
}

/**
 * ピッカーに表示する列数を返す
 */
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

/**
 * ピッカーに表示する行数を返す
 */
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.array count];
}

/**
 * ピッカーに表示する値を返す
 */
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.array objectAtIndex:row];
}

// 文字サイズ
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    
    UILabel *myView = nil;
    myView = [[UILabel alloc] init];
    
    myView.text = [self.array objectAtIndex:row];
        
    myView.textAlignment = NSTextAlignmentCenter;
    myView.font = [UIFont systemFontOfSize:20];         //用label来设置字体大小
    myView.textColor = [UIColor whiteColor];
    myView.backgroundColor = [UIColor clearColor];
    
    return myView;
}

/**
 * ピッカーの選択行が決まったとき
 */
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (!self.pickFlg) {
        if ([pickerView selectedRowInComponent:0] == 0) {
            self.discussTime = 300;
        } else if ([pickerView selectedRowInComponent:0] == 1) {
            self.discussTime = 180;
        } else if ([pickerView selectedRowInComponent:0] == 2) {
            self.discussTime = 60;
        }
        self.pickFlg = YES;
    }
}

- (IBAction)startButtonPressed:(id)sender {
    self.startButton.enabled = NO;
    
    [NSTimer scheduledTimerWithTimeInterval:1.0 //タイマーを発生させる間隔（1秒毎）
                                     target:self //メソッドがあるオブジェクト
                                   selector:@selector(driveClock:) //呼び出すメソッド
                                   userInfo:nil //メソッドに渡すパラメータ
                                    repeats:YES]; //繰り返し
}

- (void)driveClock:(NSTimer *)timer
{
    self.discussTime --;
    if (self.discussTime <= 0) {
        self.minute.text = @"0";
        self.second.text = @"0";
        
        NSString *soundFilePath = [NSString stringWithFormat:@"%@", self.alarmSound];
        //サウンドのパスから、再生するURLを作成する
        NSURL *soundURL = [NSURL fileURLWithPath:soundFilePath];
        //エラーの初期状態を設定
        NSError *error = nil;
        //サウンド再生用のプレイヤーを作成する
        self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURL error:&error];
        //エラーを判別する条件文
        if (error != nil) {
            NSLog(@"AVAudioPlayerのイニシャライズでエラー(%@)",[error localizedDescription]);
            return;
        }
        //自分自身をデリゲートに設定
        [self.player setDelegate:self];
        //プレイヤーを再生する
        [self.player play];
    } else {
        long second;
        if (self.discussTime <= 300 && self.discussTime >= 240) {
            self.minute.text = @"4";
            second = self.discussTime - 240;
            self.second.text = [NSString stringWithFormat:@"%ld", second];
        } else if (self.discussTime < 240 && self.discussTime >= 180) {
            self.minute.text = @"3";
            second = self.discussTime - 180;
            self.second.text = [NSString stringWithFormat:@"%ld", second];
        } else if (self.discussTime < 180 && self.discussTime >= 120) {
            self.minute.text = @"2";
            second = self.discussTime - 120;
            self.second.text = [NSString stringWithFormat:@"%ld", second];
        } else if (self.discussTime < 120 && self.discussTime >= 60) {
            self.minute.text = @"1";
            second = self.discussTime - 60;
            self.second.text = [NSString stringWithFormat:@"%ld", second];
        } else if (self.discussTime < 60 && self.discussTime > 0) {
            self.minute.text = @"0";
            second = self.discussTime;
            self.second.text = [NSString stringWithFormat:@"%ld", second];
        }
    }
}
@end

//
//  ViewController.m
//  macroCalc
//
//  Created by 井出拓弥 on 2019/03/07.
//  Copyright © 2019 井出拓弥. All rights reserved.
//

#import "ViewController.h"
#import "MacroCalcModel.h"

@interface ViewController () <UITextFieldDelegate>
/** 性別を入力するトグルスイッチ */
@property (weak, nonatomic) IBOutlet UISegmentedControl *sexToggleSwitch;
/** 身長を入力するテキストフィールド　*/
@property (weak, nonatomic) IBOutlet UITextField *heightTextField;
/** 体重を入力するテキストフィールド　*/
@property (weak, nonatomic) IBOutlet UITextField *weightTextField;
/** 年齢を入力するテキストフィールド　*/
@property (weak, nonatomic) IBOutlet UITextField *ageTextField;
/* タンパク質ラベル**/
@property (weak, nonatomic) IBOutlet UILabel *protein;
/* 脂質ラベル**/
@property (weak, nonatomic) IBOutlet UILabel *lipid;
/* 炭水化物ラベル**/
@property (weak, nonatomic) IBOutlet UILabel *carbonate;
/** 身長 */
@property (nonatomic, assign) CGFloat height;
/** 体重 */
@property (nonatomic, assign) CGFloat weight;
/** 年齢 */
@property (nonatomic, assign) CGFloat age;
/** マクロ栄養素計算モデル */
@property (nonatomic, strong) MacroCalcModel *model;
/** 基礎代謝ラベル */
@property (weak, nonatomic) IBOutlet UILabel *BasalMetabolismLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // モデルのインスタンス生成
    self.model = [MacroCalcModel new];
}

/** テキストフィールドの編集が完了した時に変数に値を入れる */
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    
    switch (textField.tag) {
        case 0:
            self.height = [textField.text floatValue];
            break;
        case 1:
            self.weight = [textField.text floatValue];
            break;
        case 2:
            self.age = [textField.text floatValue];
            break;
        default:
            break;
    }
    
    return YES;
}

/** Returnが押された時にキーボードを閉じる */
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.heightTextField resignFirstResponder];
    [self.weightTextField resignFirstResponder];
    [self.ageTextField resignFirstResponder];
    
    return YES;
}

- (IBAction)tappedCalcButton:(id)sender {
    CGFloat BasalMetabolism = [self.model calcMetabolism: self.height
                                                  weight:self.weight
                                                     age:self.age
                                                     sex:self.sexToggleSwitch.selectedSegmentIndex];
    
    self.BasalMetabolismLabel.text = [NSString stringWithFormat: @"%.f kcal", BasalMetabolism];
}

- (IBAction)tappedCalcMacroButton:(id)sender {
    NSArray *macroArray = [self.model calcMacro:self.weight];
    
    self.protein.text = [NSString stringWithFormat: @"%.f g" ,[[macroArray objectAtIndex:0] floatValue]];
    self.lipid.text = [NSString stringWithFormat: @"%.f g" ,[[macroArray objectAtIndex:1] floatValue]];
    self.carbonate.text = [NSString stringWithFormat: @"%.f g" ,[[macroArray objectAtIndex:2] floatValue]];
}


@end

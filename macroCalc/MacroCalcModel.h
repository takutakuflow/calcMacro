//
//  MacroCalcModel.h
//  macroCalc
//
//  Created by 井出拓弥 on 2019/03/07.
//  Copyright © 2019 井出拓弥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MacroCalcModel : NSObject

/**
 * 基礎代謝を計算して返す
 *
 * @param height 身長
 * @param weight 体重
 * @param age 年齢
 * @param sex 性別 YES:男性 NO:女性
 * @return 基礎代謝
 */
- (CGFloat)calcMetabolism:(CGFloat)height
                   weight:(CGFloat)weight
                      age:(CGFloat)age
                      sex:(BOOL)sex;

/**
 * マクロ栄養素を計算して返す
 *
 * @param weight 体重
 * @return マクロ栄養素
 */
- (NSArray *)calcMacro:(CGFloat)weight;

@end

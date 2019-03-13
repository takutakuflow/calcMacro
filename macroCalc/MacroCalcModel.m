//
//  MacroCalcModel.m
//  macroCalc
//
//  Created by 井出拓弥 on 2019/03/07.
//  Copyright © 2019 井出拓弥. All rights reserved.
//

#import "MacroCalcModel.h"

@interface MacroCalcModel()

/** 基礎代謝 */
@property (nonatomic, assign) CGFloat BasalMetabolism;

@end

@implementation MacroCalcModel

/** 基礎代謝を計算して返す */
- (CGFloat)calcMetabolism:(CGFloat)height
                   weight:(CGFloat)weight
                      age:(CGFloat)age
                      sex:(BOOL)sex {
    // 基礎代謝を計算
    // 補正値
    // 男 : +5
    // 女 : -161
    self.BasalMetabolism = 10 * weight + 6.25 * height - 5 * age + (sex ? -161 : 5);
    
    return self.BasalMetabolism;
}

- (NSArray *)calcMacro:(CGFloat)weight {
    NSMutableArray *array = [NSMutableArray array];
    
    // タンパク質
    float protein = weight * 2;
    // 脂質
    float lipid = (self.BasalMetabolism / 4) / 9;
    // 炭水化物
    float carbohydrate = (self.BasalMetabolism - protein * 4 - lipid * 9) / 4;
    
    [array addObject:[[NSNumber alloc] initWithFloat:protein]];
    [array addObject:[[NSNumber alloc] initWithFloat:lipid]];
    [array addObject:[[NSNumber alloc] initWithFloat:carbohydrate]];
    
    return array;
}

@end

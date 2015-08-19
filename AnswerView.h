//
//  AnswerView.h
//  autolayouts
//
//  Created by Otatime on 8/18/15.
//  Copyright (c) 2015 Cao Phuoc Thanh. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AnswerViewDelegate<NSObject>
@required
- (void)didTouchButton:(UIButton *)button ratingDidChange:(float)index;
@end
@interface AnswerView : UIView{
}
@property(nonatomic,strong)UIButton* AButton;
@property(nonatomic,strong)UIButton* BButton;
@property(nonatomic,strong)UIButton* CButton;
@property(nonatomic,strong)UIButton* DButton;
@property(nonatomic,strong)UIButton* resultButton;
@property(nonatomic,strong)NSDictionary *viewsDict;
@property (assign) id <AnswerViewDelegate> delegate;

@end

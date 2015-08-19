//
//  AnswerView.m
//  autolayouts
//
//  Created by Otatime on 8/18/15.
//  Copyright (c) 2015 Cao Phuoc Thanh. All rights reserved.
//

#import "AnswerView.h"

@implementation AnswerView
@synthesize AButton =_AButton;
@synthesize BButton =_BButton;
@synthesize CButton =_CButton;
@synthesize DButton =_DButton;
@synthesize resultButton= _resultButton;


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    NSLog(@"ABC");
    [super drawRect:rect];
    [self bashInt];
    [self drawView];
    [self addConstraint];
    NSLog(@"%@",self.backgroundColor);
}


-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self bashInt];
        [self drawView];
        [self addConstraint];
    }
    return self;
}

-(void)bashInt{
    _AButton=[[UIButton alloc]init];
    _BButton=[[UIButton alloc]init];
    _CButton=[[UIButton alloc]init];
    _DButton=[[UIButton alloc]init];
    _resultButton=[[UIButton alloc]init];;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        [self bashInt];
    }
    return self;
}

#pragma addcontraint
-(void)addConstraint{
    //TODO: add contraint

    _AButton.translatesAutoresizingMaskIntoConstraints = NO;
     _BButton.translatesAutoresizingMaskIntoConstraints = NO;
     _CButton.translatesAutoresizingMaskIntoConstraints = NO;
     _DButton.translatesAutoresizingMaskIntoConstraints = NO;
    _resultButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSDictionary *viewsDict = NSDictionaryOfVariableBindings(_resultButton,_AButton, _BButton, _CButton,_DButton);

    NSNumber *distancies=[NSNumber numberWithFloat:self.frame.size.height/9];
    [self addConstraints: [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-dis-[_resultButton]-|"
                                                                  options:0 metrics:@{@"dis":distancies} views:viewsDict]];
    
    
    // "<NSLayoutConstraint:0x7fd570515670 V:[UIButton:0x7fd57052f200'RESULT']-(14.8889)-|   (Names: '|':AnswerView:0x7fd57052e230 )>",
    [self addConstraints: [NSLayoutConstraint
                           constraintsWithVisualFormat:@"V:[_resultButton]-dis-|"
                          options:0 metrics:@{@"dis":distancies} views:viewsDict]];
    
    [self addConstraints:[NSLayoutConstraint
                          constraintsWithVisualFormat:@"V:|-dis-[_AButton(_resultButton)]-dis-[_resultButton(_AButton)]-dis-|" options:0 metrics:@{@"dis":distancies} views:viewsDict]];
    [self addConstraints:[NSLayoutConstraint
                          constraintsWithVisualFormat:@"V:|-dis-[_DButton(_resultButton)]-dis-[_resultButton(_DButton)]-dis-|"
                          options:0 metrics:@{@"dis":distancies} views:viewsDict]];
    [self addConstraints:[NSLayoutConstraint
                          constraintsWithVisualFormat:@"V:|-dis-[_BButton(_resultButton)]-dis-[_resultButton(_BButton)]-|"
                          options:0 metrics:@{@"dis":distancies} views:viewsDict]];
    [self addConstraints:[NSLayoutConstraint
                          constraintsWithVisualFormat:@"V:|-dis-[_CButton(_resultButton)]-dis-[_resultButton(_CButton)]-dis-|"
                          options:0 metrics:@{@"dis":distancies} views:viewsDict]];
    //set equal width A,B,C,D
    [self addConstraints: [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-dis-[_AButton(==_BButton)]-dis-[_BButton(==_CButton)]-dis-[_CButton(==_DButton)]-dis-[_DButton(==_AButton)]-dis-|" options:0 metrics:@{@"dis":distancies} views:viewsDict]];
    
    
    
    [self addConstraints: [NSLayoutConstraint constraintsWithVisualFormat:@"V:[_resultButton]-dis-|" options:0 metrics:@{@"dis":distancies} views:viewsDict]];

    NSLog(@"viewsDict: %@",self.constraints);
    
    
    

}

#pragma drawn button
-(void)drawView{
    //TODO: set background and shadown view
    NSLog(@"draw view");
    [self drawShadownMainView:self.layer];
    
    //TODO: set color, text, shadown button A
    _AButton.backgroundColor=[UIColor lightGrayColor];
    [_AButton setTitle: @"A" forState: UIControlStateNormal];
    [self drawShadownButton:_AButton.layer];
    _AButton.tintColor=self.backgroundColor;
    _AButton.tag=1;
    [_AButton addTarget:self
                 action:@selector(handleTouchButton:)
       forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:_AButton];
    
    //TODO: set color, text, shadown button B
    _BButton.backgroundColor=[UIColor lightGrayColor];
    [self drawShadownButton:_BButton.layer];
    [_BButton setTitle: @"B" forState: UIControlStateNormal];
    _BButton.tintColor=self.backgroundColor;
    _BButton.tag=2;
    [_BButton addTarget:self
                 action:@selector(handleTouchButton:)
       forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_BButton];
    
    //TODO: set color, text, shadown button C
    _CButton.backgroundColor=[UIColor lightGrayColor];
    [self drawShadownButton:_CButton.layer];
    [_CButton setTitle: @"C" forState: UIControlStateNormal];
    _CButton.tintColor=self.backgroundColor;
    _CButton.tag=3;
    [_CButton addTarget:self
                 action:@selector(handleTouchButton:)
       forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_CButton];
    
    //TODO: set color, text, shadown button D
    _DButton.backgroundColor=[UIColor lightGrayColor];
    [self drawShadownButton:_DButton.layer];
    [_DButton setTitle: @"D" forState: UIControlStateNormal];
    _DButton.tintColor=self.backgroundColor;
    _DButton.tag=4;
    [_BButton addTarget:self
                 action:@selector(handleTouchButton:)
       forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_DButton];
    
    //TODO: set color, text, shadown button resutl
    _resultButton.backgroundColor=[UIColor lightGrayColor];
    [self drawShadownButton:_resultButton.layer];
    [_resultButton setTitle: @"RESULT" forState: UIControlStateNormal];
    _resultButton.tag=0;
    [_resultButton addTarget:self
                 action:@selector(handleTouchButton:)
       forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_resultButton];
}


#pragma acttion button
-(void)handleTouchButton:(UIButton*)sender{
    if (self.delegate && [self.delegate respondsToSelector:@selector(didTouchButton:ratingDidChange:)])
    {
        [self.delegate didTouchButton:sender ratingDidChange:sender.tag];
    }else {
        NSLog(@"Error: Please add delegate for AnwserView.");
    }
}

#pragma draw shadown
-(void)drawShadownMainView:(CALayer*)layyer{
    layyer.masksToBounds = NO;
    layyer.shadowOffset = CGSizeMake(0, -2);
    layyer.shadowRadius = 1;
    layyer.shadowOpacity = 0.3;
    layyer.shadowColor=[[UIColor blackColor] CGColor];
}

-(void)drawShadownButton:(CALayer*)layyer{
    layyer.masksToBounds = NO;
    layyer.cornerRadius = 8;
    layyer.shadowOffset = CGSizeMake(8, 8);
    layyer.shadowRadius = 0;
    layyer.shadowOpacity = 0.3;
    layyer.shadowColor=[[UIColor darkGrayColor] CGColor];
}

@end

//
//  ViewController.m
//  openCV-Practice
//
//  Created by Realank on 16/4/29.
//  Copyright © 2016年 realank. All rights reserved.
//

#import "ViewController.h"
#import "VideoViewController.h"
#import "ANOpenCVViewController.h"

#import "OpenCVUtil.h"

@interface ViewController ()


@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"very before");
    NSLog(@"before");
    self.imgView.image = [OpenCVUtil faceDetectForImage:[UIImage imageNamed:@"face"]];
    NSLog(@"after");
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(dealWithImage:) name:@"image" object:nil];
    
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (void)dealWithImage:(NSNotification *)noti {
    
    NSDictionary *usrInfo = noti.userInfo;
    
    self.imgView.image = [usrInfo objectForKey:@"newImg"];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
//    VideoViewController *vc = [[VideoViewController alloc]init];
    
    ANOpenCVViewController *vc = [[ANOpenCVViewController alloc]init];
    
    [self.navigationController pushViewController:vc animated:YES];
}


@end

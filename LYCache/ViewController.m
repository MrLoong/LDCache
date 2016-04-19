//
//  ViewController.m
//  LYCache
//
//  Created by LastDays on 16/4/14.
//  Copyright © 2016年 LastDays. All rights reserved.
//

#import "ViewController.h"
#import "LYImageDownloader.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *status;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

}
- (IBAction)test:(id)sender {
    
    [[LYImageDownloader shareDownloader] downloaderImageWithDownloaderWithURL:[NSURL URLWithString:@"https://sinacloud.net/keke-han/2.jpg"]
                                                      DownloaderProgressBlock:^(NSInteger alreadyReceiveSize,NSInteger expectedContentLength){
                                                          NSLog(@"下载进度1：alreadyReceiveSize = %ld",(long)alreadyReceiveSize);
                                                          NSLog(@"下载进度1：expectedContentLength = %ld",(long)expectedContentLength);
                                                          NSLog(@"下载进度1：f = %f",alreadyReceiveSize/(double)expectedContentLength);
                                                          NSLog(@"------------------------");
                                                          
                                                         // float progressFloat = alreadyReceiveSize/expectedContentLength;
                                                          self.progressView.progress = alreadyReceiveSize/(double)expectedContentLength;
                                                      }
                                                     DownloaderCompletedBlock:^(NSData *data,UIImage *image,NSError *error,BOOL finished){
                                                         NSLog(@"触发了完成1");
                                                         NSLog(@"error = %@",error);
                                                         if (finished) {
                                                             [self updata];
                                                         }
                                                     }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)updata{
    dispatch_sync(dispatch_get_main_queue(), ^{
        self.status.text = @"成功";
    });
    
}


@end

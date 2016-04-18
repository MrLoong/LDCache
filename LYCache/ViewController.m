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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    
    [[LYImageDownloader shareDownloader] downloaderImageWithDownloaderWithURL:[NSURL URLWithString:@"https://sinacloud.net/keke-han/1.jpg"]
                                                   DownloaderProgressBlock:^(NSInteger AlreadyReceiveSize,NSInteger NotReceiveSize){
                                                       NSLog(@"下载进度1：AlreadyReceiveSize = %ld",(long)AlreadyReceiveSize);
                                                       NSLog(@"下载进度1：NotReceiveSize = %ld",(long)NotReceiveSize);
                                                       
                                                       NSLog(@"------------------------");
                                                   }
                                                  DownloaderCompletedBlock:^(NSData *data,UIImage *image,NSError *error,BOOL finished){
                                                      NSLog(@"触发了完成1");
                                                  }];
    [[LYImageDownloader shareDownloader] downloaderImageWithDownloaderWithURL:[NSURL URLWithString:@"https://sinacloud.net/keke-han/2.jpg"]
                                                      DownloaderProgressBlock:^(NSInteger AlreadyReceiveSize,NSInteger NotReceiveSize){
                                                          NSLog(@"下载进度2：AlreadyReceiveSize = %ld",(long)AlreadyReceiveSize);
                                                          NSLog(@"下载进度2：NotReceiveSize = %ld",(long)NotReceiveSize);
                                                          
                                                          NSLog(@"======================");
                                                      }
                                                     DownloaderCompletedBlock:^(NSData *data,UIImage *image,NSError *error,BOOL finished){
                                                         NSLog(@"触发了完成2");
                                                     }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

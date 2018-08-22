//
//  ViewController.m
//  AudioConvert
//
//  Created by 王胜华 on 2018/8/22.
//  Copyright © 2018 王胜华. All rights reserved.
//

#import "ViewController.h"
#import "TPAACAudioConverter.h"

@interface ViewController () <TPAACAudioConverterDelegate>

@property (nonatomic, strong) TPAACAudioConverter *audioConverter;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *documentsFolders = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    self.audioConverter = [[TPAACAudioConverter alloc] initWithDelegate:self
                                                                 source:[[NSBundle mainBundle] pathForResource:@"abc" ofType:@"wav"]
                                                            destination:[[documentsFolders objectAtIndex:0] stringByAppendingPathComponent:@"abc.m4a"]];
    
    NSLog(@"convert start");
    [self.audioConverter start];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TPAACAudioConverterDelegate
- (void)AACAudioConverter:(TPAACAudioConverter *)converter didMakeProgress:(CGFloat)progress
{
//    NSLog(@"didMakeProgress:%f", progress);
}

- (void)AACAudioConverterDidFinishConversion:(TPAACAudioConverter *)converter
{
    NSLog(@"AACAudioConverterDidFinishConversion");
}

-(void)AACAudioConverter:(TPAACAudioConverter *)converter didFailWithError:(NSError *)error {
    NSLog(@"didFailWithError");
    self.audioConverter = nil;
}


@end

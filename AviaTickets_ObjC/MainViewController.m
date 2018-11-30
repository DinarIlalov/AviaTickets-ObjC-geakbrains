//
//  MainViewController.m
//  AviaTickets_ObjC
//
//  Created by Илалов Динар on 29/11/2018.
//  Copyright © 2018 Илалов Динар. All rights reserved.
//

#import "MainViewController.h"
#import "DataManager.h"

@interface MainViewController ()

@property (nonatomic, strong) UILabel *loadingStatusLabel;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blueColor];
    
    [self addLoadingStatusLabel];
    
    [[DataManager sharedInstance] loadData];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadDataComplete) name:kDataManagerLoadDataDidComplete object:nil];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kDataManagerLoadDataDidComplete object:nil];
}

- (void)loadDataComplete
{
    self.view.backgroundColor = [UIColor yellowColor];
    
    self.loadingStatusLabel.text = @"Загрузка завершена";
}

- (void)addLoadingStatusLabel {
    
    self.loadingStatusLabel = [[UILabel alloc] initWithFrame: CGRectMake(50, 100, 200, 20)];
    self.loadingStatusLabel.text = @"Загрузка";
    [self.view addSubview:self.loadingStatusLabel];
}

@end

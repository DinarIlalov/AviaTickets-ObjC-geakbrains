//
//  MainViewController.m
//  AviaTickets_ObjC
//
//  Created by Илалов Динар on 29/11/2018.
//  Copyright © 2018 Илалов Динар. All rights reserved.
//

#import "MainViewController.h"
#import "DataManager.h"
#import "PlaceViewController.h"

@interface MainViewController () <PlaceViewControllerDelegate>

@property (nonatomic, strong) UIButton *selectOriginButton;
@property (nonatomic, strong) UIButton *selectDestinationButton;
@property (nonatomic) SearchRequest searchRequest;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Поиск";
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    self.view.backgroundColor = [UIColor blueColor];
    
    [self configureView];
    
    [[DataManager sharedInstance] loadData];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadDataComplete) name:kDataManagerLoadDataDidComplete object:nil];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kDataManagerLoadDataDidComplete object:nil];
}

- (void)loadDataComplete
{
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)configureView {
    
    CGFloat buttonsHeight = 30;
    CGFloat offsetFromSuperview = 8;
    
    CGFloat buttonsY = 160;
    
    CGFloat buttonsLeftX = offsetFromSuperview;
    CGFloat buttonsRightX = self.view.bounds.size.width - offsetFromSuperview;
    
    self.selectOriginButton = [[UIButton alloc] initWithFrame:
                               CGRectMake(buttonsLeftX, buttonsY, buttonsRightX - buttonsLeftX, buttonsHeight)];
    [self.selectOriginButton setTitle:@"<Откуда>" forState:UIControlStateNormal];
    [self.selectOriginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.selectOriginButton.backgroundColor = [UIColor blueColor];
    
    self.selectDestinationButton = [[UIButton alloc] initWithFrame:
                                    CGRectMake(buttonsLeftX, buttonsY + buttonsHeight + 10, buttonsRightX - buttonsLeftX, buttonsHeight)];
    [self.selectDestinationButton setTitle:@"<Куда>" forState:UIControlStateNormal];
    [self.selectDestinationButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.selectDestinationButton.backgroundColor = [UIColor blueColor];
    
    [self.selectOriginButton addTarget:self action:@selector(selectOrigin:) forControlEvents:UIControlEventTouchUpInside];
    [self.selectDestinationButton addTarget:self action:@selector(selectOrigin:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview: self.selectOriginButton];
    [self.view addSubview: self.selectDestinationButton];

}

- (void) selectOrigin:(UIButton *) sender {
    
    PlaceViewController *viewController;
    if (sender == self.selectOriginButton) {
        viewController = [[PlaceViewController alloc] initWithType:PlaceTypeDeparture];
    } else if (sender == self.selectDestinationButton) {
        viewController = [[PlaceViewController alloc] initWithType:PlaceTypeArrival];
    }
    viewController.delegate = self;
    [self showViewController:viewController sender:nil];
    
}

#pragma mark PlaceViewControllerDelegate

- (void)selectPlace:(id)place withType:(PlaceType)placeType andDataType:(DataSourceType)dataType {
    [self setPlace:place
      withDataType:dataType
      andPlaceType:placeType
         forButton:(placeType == PlaceTypeDeparture) ? self.selectOriginButton : self.selectDestinationButton];
}

- (void)setPlace:(id)place withDataType:(DataSourceType)dataType andPlaceType:(PlaceType)placeType forButton:(UIButton *)button {
    NSString *title;
    NSString *cityCode;
    if (dataType == DataSourceTypeCity) {
        City *city = (City *)place;
        title = city.name;
        cityCode = city.code;
    }
    else if (dataType == DataSourceTypeAirport) {
        Airport *airport = (Airport *)place;
        title = airport.name;
        cityCode = airport.cityCode;
    }
    if (placeType == PlaceTypeDeparture) {
        _searchRequest.origin = cityCode;
    } else {
        _searchRequest.destination = cityCode;
    }
    [button setTitle: title forState: UIControlStateNormal];
}

@end

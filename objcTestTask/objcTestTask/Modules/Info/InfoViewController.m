//
//  InfoViewController.m
//  objcTestTask
//
//  Created by Iskander Foatov on 17.10.2019.
//  Copyright © 2019 Iskander Foatov. All rights reserved.
//

#import "InfoViewController.h"
#import <MapKit/MapKit.h>
#import "Entity.h"

@interface InfoViewController ()

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIStackView *stackView;


@end

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)setup {
    if (!self.entity) {
        return;
    }
    [self addLabelWith:@"id" value:self.entity.entityId];
    [self addLabelWith:@"name" value:self.entity.name];
    [self addLabelWith:@"country" value:self.entity.country];
    [self addLabelWith:@"lat" value:[NSString stringWithFormat:@"%f", self.entity.lat]];
    [self addLabelWith:@"lon" value:[NSString stringWithFormat:@"%f", self.entity.lon]];
    CLLocationCoordinate2D center = CLLocationCoordinate2DMake(self.entity.lat, self.entity.lon);
    MKCoordinateSpan span = MKCoordinateSpanMake(3, 3);
    MKCoordinateRegion region = MKCoordinateRegionMake(center, span);
    [self.mapView setRegion:region];

    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    annotation.coordinate = center;
    annotation.title = self.entity.name;
    annotation.subtitle = self.entity.country;
    [self.mapView addAnnotation: annotation];
}

- (void)addLabelWith:(NSString *) name value:(NSString *)value {
    UILabel *label = [UILabel new];
    label.text = [NSString stringWithFormat:@"%@: %@", name, value];
    [self.stackView addArrangedSubview:label];
}



@end

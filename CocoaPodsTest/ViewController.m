//
//  ViewController.m
//  CocoaPodsTest
//
//  Created by 方寸山 on 2017/10/30.
//  Copyright © 2017年 LINYUT. All rights reserved.
//

#import "ViewController.h"
#import "CocoaPodsTest-Bridging-Header.h"
#import "UIImageView+WebCache.h"
#import "UIImage+GIF.h"

@interface ViewController ()<ChartViewDelegate>

@property(nonatomic,strong)LineChartView *chartView;
@property(nonatomic,retain)LineChartData *lineChartData;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self createUI];
    [self prepareData];
}

-(void)prepareData
{
    _chartView = [[LineChartView alloc]init];
    [self.view addSubview:_chartView];
    _chartView.frame = CGRectMake(0, 40, self.view.frame.size.width, self.view.frame.size.height - 80);
    
    _chartView.descriptionText = @"xxx描述";
    _chartView.noDataText = @"没有数据";
    _chartView.noDataTextDescription = @"没有更多的数据详细描述";
    _chartView.dragEnabled = YES;//设置图表里能不能被拖动
    [_chartView setScaleEnabled:YES];//设置图表能不能被放大
    _chartView.pinchZoomEnabled = NO;
    _chartView.drawGridBackgroundEnabled = YES;
    _chartView.delegate = self;
    _chartView.xAxis.labelPosition = XAxisLabelPositionBottom;//设置x轴在下面显示，默认是在上面
    
    _chartView.data = self.lineChartData;//设置数据
}

-(LineChartData *)lineChartData{
    
    NSMutableArray *xVals = [[NSMutableArray alloc]initWithCapacity:12];
    for (int i = 0; i < 12; i++)
    {
        [xVals addObject:[NSString stringWithFormat:@"%d月",i+1]];
    }
    
    NSMutableArray *yVals = [[NSMutableArray alloc] init];
    for (int i = 0; i < 12; i++)
    {
        double mult = (12 + 1);
        double val = (double) (arc4random_uniform(mult)) + 3;
        [yVals addObject:[[ChartDataEntry alloc] initWithValue:val xIndex:i]];
    }
    
    NSMutableArray *yVals2 = [[NSMutableArray alloc] init];
    for (int i = 0; i < 12; i++)
    {
        double mult = (12 + 1);
        double val = (double) (arc4random_uniform(mult)) + 13;
        [yVals2 addObject:[[ChartDataEntry alloc] initWithValue:val xIndex:i]];
    }
    
    LineChartDataSet *set1 = nil;
    LineChartDataSet *set2 = nil;
    if (_chartView.data.dataSetCount > 0)
    {
        set1 = (LineChartDataSet *)_chartView.data.dataSets[0];
        set1.yVals = yVals;
        _chartView.data.xValsObjc = xVals;
        [_chartView notifyDataSetChanged];
    }
    else
    {
        set1 = [[LineChartDataSet alloc] initWithYVals:yVals label:@"lineChartData 1"];
        //set1.lineDashLengths = @[@5.f, @2.5f];
        //set1.highlightLineDashLengths = @[@5.f, @2.5f];
        [set1 setColor:UIColor.blackColor];
        [set1 setCircleColor:UIColor.blackColor];
        set1.lineWidth = 1.0;
        set1.circleRadius = 3.0;
        set1.drawCircleHoleEnabled = NO;
        set1.valueFont = [UIFont systemFontOfSize:9.f];
        //set1.fillAlpha = 65/255.0;
        //set1.fillColor = UIColor.blackColor;
        
        NSArray *gradientColors = @[
                                    (id)[ChartColorTemplates colorFromString:@"#00ff0000"].CGColor,
                                    (id)[ChartColorTemplates colorFromString:@"#ffff0000"].CGColor
                                    ];
        CGGradientRef gradient = CGGradientCreateWithColors(nil, (CFArrayRef)gradientColors, nil);
        
        set1.fillAlpha = 1.f;
        set1.fill = [ChartFill fillWithLinearGradient:gradient angle:90.f];
        set1.drawFilledEnabled = YES;
        
        CGGradientRelease(gradient);
        
        set2 = [[LineChartDataSet alloc] initWithYVals:yVals2 label:@"lineChartData 2"];
        //        set2.lineDashLengths = @[@5.f, @2.5f];
        //        set2.highlightLineDashLengths = @[@5.f, @2.5f];
        [set2 setColor:UIColor.yellowColor];//设置set2线条的颜色
        [set2 setCircleColor:UIColor.purpleColor];//设置set2的小圆圈的颜色
        set2.lineWidth = 1.0;
        set2.circleRadius = 3.0;
        set2.drawCircleHoleEnabled = NO;
        set2.valueFont = [UIFont systemFontOfSize:9.f];
        
        _lineChartData = [[LineChartData alloc] initWithXVals:xVals dataSets:@[set1,set2]];
    }
    
    return _lineChartData;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

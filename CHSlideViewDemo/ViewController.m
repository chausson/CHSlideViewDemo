
#import "ViewController.h"
#import "CHSlideView.h"
#import "CHSlideConfig.h"
#import "CHSlideCell.h"
#import "YGPCache.h"

@interface ViewController ()<CHSlideViewDelegate,UITableViewDataSource,UITableViewDelegate>
{

    CHSlideView * _slideView;
    NSArray *colors;
    NSArray *_testArray;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"新闻类客户端ScrollView重用";
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.extendedLayoutIncludesOpaqueBars =NO;
    self.modalPresentationCapturesStatusBarAppearance =NO;
    self.navigationController.navigationBar.translucent =NO;
    
    colors = @[@"体育",
               @"NBA",
               @"新闻娱乐",
               @"电子游戏",
               @"电影",
               @"电视剧",
               @"动漫"];
    
    _slideView = [[CHSlideView alloc]initWithFrame:CGRectMake(0, 0,
                                                              SCREEN_WIDTH_CHSLIDE,
                                                              SCREEN_HEIGHT_CHSLIDE-64)
                                         forTitles:colors];
    _slideView.contentViewColor = [UIColor colorWithRed:250/255.0 green:250/255.0 blue:250/255.0 alpha:1];
    _slideView.delegate        = self;
    _slideView.allowedScaleFontSize = YES;
    _slideView.allowedScrollContentTitle = YES;
    _slideView.sizeToFitTitleWidth = YES;
    _slideView.widthGap = 20;
    _slideView.slideTitleViewTitleMin = 14.f;
    _slideView.slideTitleViewTitleMax = 15.f;
    _slideView.tintColor = [UIColor orangeColor];
    [self.view addSubview:_slideView];
    
}

- (NSInteger)columnNumber{
    return colors.count;
}

- (CHSlideCell *)slideView:(CHSlideView *)slideView
         cellForRowAtIndex:(NSUInteger)index{

    CHSlideCell * cell = [slideView dequeueReusableCell];
    
    if (!cell) {
        cell = [[CHSlideCell alloc]initWithFrame:CGRectMake(0, 0, 320, 500)
                                           style:UITableViewStylePlain];
        cell.delegate   = self;
        cell.dataSource = self;
    }
    
//    cell.backgroundColor = colors[index];
    
    
    return cell;
}
- (void)slideVisibleView:(CHSlideCell *)cell forIndex:(NSUInteger)index{
    
    NSLog(@"index :%@ ",@(index));
    [cell reloadData]; //刷新TableView
//    NSLog(@"刷新数据");
}

- (void)slideViewInitiatedComplete:(CHSlideCell *)cell forIndex:(NSUInteger)index{

    //可以在这里做数据的预加载（缓存数据）
    NSLog(@"缓存数据 %@",@(index));
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [cell reloadData];

    });
}

#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 20;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    NSString *Identifier = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
    }
    
    cell.textLabel.text = [@(arc4random()%1000) stringValue];
    
    
    return cell;
}

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com
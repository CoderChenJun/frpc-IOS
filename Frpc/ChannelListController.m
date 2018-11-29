//
//  ChannelListController.m
//  Frpc
//
//  Created by 任楚伊 on 2018/11/28.
//  Copyright © 2018 yuanyl. All rights reserved.
//

#import "ChannelListController.h"
#import "ConfigChannelController.h"

@interface ChannelListController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *channelArr;
@end

@implementation ChannelListController
#pragma mark - lazy load
- (NSMutableArray *)channelArr {
    if (!_channelArr) {
        _channelArr = [NSMutableArray array];
    }
    return _channelArr;
}

#pragma mark - set navigation
- (void)setNavigation {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"添加" style:UIBarButtonItemStylePlain target:self action:@selector(addChannel)];
    
}

- (void)addChannel {
    ConfigChannelController *configVc = [ConfigChannelController new];
    [self.navigationController showViewController:configVc sender:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigation];
    // Do any additional setup after loading the view from its nib.
}

#pragma mark - tableview delegate & datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.channelArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"channelCell" forIndexPath:indexPath];
    cell.textLabel.text = _channelArr[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

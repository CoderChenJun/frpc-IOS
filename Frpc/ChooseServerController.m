//
//  ChooseServerController.m
//  Frpc
//
//  Created by 任楚伊 on 2018/11/28.
//  Copyright © 2018 yuanyl. All rights reserved.
//

#import "ChooseServerController.h"
#import "AddServerController.h"
#import <BRPickerView.h>
@interface ChooseServerController ()<UITextFieldDelegate>
    @property (nonatomic, strong) NSMutableArray *localServerArr;
    @property (nonatomic, strong) NSMutableArray *freeServerArr;
    @property (weak, nonatomic) IBOutlet UITextField *localServerField;
    @property (weak, nonatomic) IBOutlet UITextField *freeServerField;
    @property (weak, nonatomic) IBOutlet UILabel *versionLab;
    
@end

@implementation ChooseServerController
#pragma mark - lazy load
- (NSMutableArray *)localServerArr {
    if (!_localServerArr) {
        _localServerArr = [NSMutableArray array];
    }
    return _localServerArr;
}
    
- (NSMutableArray *)freeServerArr {
    if (!_freeServerArr) {
        _freeServerArr = [NSMutableArray array];
    }
    return _freeServerArr;
}
    
#pragma mark - set UI
- (void)setUI {
    self.localServerField.layer.borderWidth = 0.5;
    self.localServerField.layer.borderColor = mainColor.CGColor;
    self.freeServerField.layer.borderWidth = 0.5;
    self.freeServerField.layer.borderColor = mainColor.CGColor;
    self.versionLab.text = versionText;
}
    
#pragma mark - set data 理论上讲这块应该是请求数据
- (void)setData {
    self.localServerArr = [NSMutableArray arrayWithArray:@[@"请选择",@"frps.frp.fun:7000:frp888:tcp",@"freenet.win:7000:frp888:tcp"]];
    self.freeServerArr = [NSMutableArray arrayWithArray:@[@"请选择",@"frps.frp.fun:7000:frp888:tcp",@"freenet.win:7000:frp888:tcp"]];
}
    
#pragma mark - action events

- (IBAction)addServerAction:(id)sender {
    AddServerController *addVC = [AddServerController new];
    [self.navigationController showViewController:addVC sender:nil];
}
    
- (IBAction)makeSureAction:(id)sender {
    
}
    
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    [self setData];
    // Do any additional setup after loading the view from its nib.
}
    
#pragma mark - textField delegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    WeakSelf;
    if (textField == _localServerField) {
        [BRStringPickerView showStringPickerWithTitle:@"本地服务器" dataSource:self.localServerArr defaultSelValue:@"" isAutoSelect:YES themeColor:mainColor resultBlock:^(id selectValue) {
            //选中回调
            if ([selectValue isEqualToString:@"请选择"]) {
                weakSelf.localServerField.text = @"";
            }else {
                weakSelf.localServerField.text = [NSString stringWithFormat:@"%@",selectValue];
            }
        }];
    }else {
        [BRStringPickerView showStringPickerWithTitle:@"公益服务器" dataSource:self.freeServerArr defaultSelValue:@"" isAutoSelect:YES themeColor:mainColor resultBlock:^(id selectValue) {
            //选中回调
            if ([selectValue isEqualToString:@"请选择"]) {
                weakSelf.freeServerField.text = @"";
            }else {
                weakSelf.freeServerField.text = [NSString stringWithFormat:@"%@",selectValue];
            }
        }];
    }
    return NO;
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

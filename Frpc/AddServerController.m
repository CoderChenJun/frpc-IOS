//
//  AddServerController.m
//  Frpc
//
//  Created by 任楚伊 on 2018/11/28.
//  Copyright © 2018 yuanyl. All rights reserved.
//

#import "AddServerController.h"
#import "ConfigChannelController.h"
#import <BRPickerView.h>

@interface AddServerController ()<UITextFieldDelegate>
    @property (weak, nonatomic) IBOutlet UITextField *hostField;
    @property (weak, nonatomic) IBOutlet UITextField *portField;
    @property (weak, nonatomic) IBOutlet UITextField *tokenField;
    @property (weak, nonatomic) IBOutlet UITextField *protocolField;
    @property (weak, nonatomic) IBOutlet UILabel *versionLab;
    @property (weak, nonatomic) IBOutlet UIButton *makeSureBtn;
    @property (nonatomic, strong) NSMutableArray *protocolArr;
@end

@implementation AddServerController
    
#pragma mark - lazy load
- (NSMutableArray *)protocolArr {
    if (!_protocolArr) {
        _protocolArr = [NSMutableArray array];
    }
    return _protocolArr;
}
    
#pragma mark - action events

- (IBAction)makeSureAction:(id)sender {
    ConfigChannelController *configVc = [ConfigChannelController new];
    [self.navigationController showViewController:configVc sender:nil];
}
    
- (void)viewDidLoad {
    [super viewDidLoad];
    _protocolArr = [NSMutableArray arrayWithArray:@[@"tcp",@"kcp",@"websocket"]];
    // Do any additional setup after loading the view from its nib.
}

#pragma mark - textfield delegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if (textField == _protocolField) {
        if ([self.hostField isFirstResponder]) {
            [self.hostField resignFirstResponder];
        }else if ([self.portField isFirstResponder]) {
            [self.portField resignFirstResponder];
        }else if ([self.tokenField isFirstResponder]) {
            [self.tokenField resignFirstResponder];
        }
        WeakSelf;
        [BRStringPickerView showStringPickerWithTitle:@"连接协议" dataSource:self.protocolArr defaultSelValue:@"tcp" isAutoSelect:YES themeColor:mainColor resultBlock:^(id selectValue) {
            //选择协议后回调
            weakSelf.protocolField.text = [NSString stringWithFormat:@"%@",selectValue];
        }];
        return NO;
    }else {
        return YES;
    }
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

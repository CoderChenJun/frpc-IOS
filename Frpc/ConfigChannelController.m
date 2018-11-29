//
//  ConfigChannelController.m
//  Frpc
//
//  Created by 任楚伊 on 2018/11/28.
//  Copyright © 2018 yuanyl. All rights reserved.
//

#import "ConfigChannelController.h"
#import "ChannelListController.h"
#import <BRPickerView.h>
@interface ConfigChannelController ()<UITextFieldDelegate>

typedef enum  {
    Type_tcp,
    Type_udp,
    Type_http,
    Type_https,
    Type_stcp,
    Type_xtcp
}ProtocolType;

@property (weak, nonatomic) IBOutlet UITextField *channelNameField;
@property (weak, nonatomic) IBOutlet UITextField *typeField;
@property (weak, nonatomic) IBOutlet UITextField *localNetField;
@property (weak, nonatomic) IBOutlet UITextField *localPortField;
@property (weak, nonatomic) IBOutlet UITextField *remotePortField;
@property (weak, nonatomic) IBOutlet UITextField *extensiveDomainField;
@property (weak, nonatomic) IBOutlet UITextField *customDomainField;
@property (weak, nonatomic) IBOutlet UITextField *encryptField;
@property (weak, nonatomic) IBOutlet UITextField *compressField;
@property (weak, nonatomic) IBOutlet UITextField *verifyAccountField;
@property (weak, nonatomic) IBOutlet UITextField *verifyCodeField;

@property (weak, nonatomic) IBOutlet UIView *remoteVIew;
@property (weak, nonatomic) IBOutlet UIView *extensiveDomainView;
@property (weak, nonatomic) IBOutlet UIView *customDomainView;
@property (weak, nonatomic) IBOutlet UIView *verifyAccountView;
@property (weak, nonatomic) IBOutlet UIView *verifyCodeView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *remotePortConsH;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *extensiveDomainConsH;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *customDomainConsH;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *verifyAccountConsH;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *verifyCodeConsH;

@property (weak, nonatomic) IBOutlet UIButton *addBtn;

@property (nonatomic, strong) NSMutableArray *typeArr;
@property (nonatomic, assign) ProtocolType type;
@end

@implementation ConfigChannelController

#pragma mark - lazy load
- (NSMutableArray *)typeArr {
    if (!_typeArr) {
        _typeArr = [NSMutableArray array];
    }
    return _typeArr;
}

#pragma mark - setter
- (void)setType:(ProtocolType)type {
    _type = type;
    switch (type) {
        case Type_tcp:case Type_udp:case Type_stcp:case Type_xtcp:
        {
            self.remotePortConsH.constant = 44;
            self.extensiveDomainConsH.constant = 0;
            self.customDomainConsH.constant = 0;
            self.verifyAccountConsH.constant = 0;
            self.verifyCodeConsH.constant = 0;
            self.remoteVIew.hidden = NO;
            self.extensiveDomainView.hidden = YES;
            self.customDomainView.hidden = YES;
            self.verifyAccountView.hidden = YES;
            self.verifyCodeView.hidden = YES;
        }
            break;
        case Type_http:case Type_https:
        {
            self.remotePortConsH.constant = 0;
            self.extensiveDomainConsH.constant = 44;
            self.customDomainConsH.constant = 44;
            self.verifyAccountConsH.constant = 44;
            self.verifyCodeConsH.constant = 44;
            self.remoteVIew.hidden = YES;
            self.extensiveDomainView.hidden = NO;
            self.customDomainView.hidden = NO;
            self.verifyAccountView.hidden = NO;
            self.verifyCodeView.hidden = NO;
        }
        default:
            break;
    }
}

- (IBAction)addAction:(id)sender {
    ChannelListController *listVc = [ChannelListController new];
    [self.navigationController showViewController:listVc sender:nil];
}


#pragma mark - set data
- (void)setData {
    self.typeArr = [NSMutableArray arrayWithArray:@[@"tcp",@"udp",@"http",@"https",@"stcp",@"xtcp"]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setData];
    //initial state
    self.type = Type_tcp;
    self.typeField.text = @"tcp";
    self.encryptField.text = @"false";
    self.compressField.text = @"false";
    // Do any additional setup after loading the view from its nib.
}

#pragma mark - textfield delegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    WeakSelf;
    if (textField == _typeField) {
        [BRStringPickerView showStringPickerWithTitle:@"选择类型" dataSource:self.typeArr defaultSelValue:@"tcp" isAutoSelect:YES themeColor:mainColor resultBlock:^(id selectValue) {
            //选择回调
            weakSelf.typeField.text = [NSString stringWithFormat:@"%@",selectValue];
            if ([selectValue isEqualToString:@"tcp"]) {
                weakSelf.type = Type_tcp;
            }else if ([selectValue isEqualToString:@"udp"]) {
                weakSelf.type = Type_udp;
            }else if ([selectValue isEqualToString:@"http"]) {
                weakSelf.type = Type_http;
            }else if ([selectValue isEqualToString:@"https"]) {
                weakSelf.type = Type_https;
            }else if ([selectValue isEqualToString:@"stcp"]) {
                weakSelf.type = Type_stcp;
            }else {
                weakSelf.type = Type_xtcp;
            }
        }];
        return NO;
    }else if (textField == _encryptField) {
        [BRStringPickerView showStringPickerWithTitle:@"加密" dataSource:@[@"false",@"true"] defaultSelValue:@"false" isAutoSelect:YES themeColor:mainColor resultBlock:^(id selectValue) {
            //选择回调
            weakSelf.encryptField.text = [NSString stringWithFormat:@"%@",selectValue];
        }];
        return NO;
    }else if (textField == _compressField) {
        [BRStringPickerView showStringPickerWithTitle:@"压缩" dataSource:@[@"false",@"true"] defaultSelValue:@"false" isAutoSelect:YES themeColor:mainColor resultBlock:^(id selectValue) {
            //选择回调
            weakSelf.compressField.text = [NSString stringWithFormat:@"%@",selectValue];
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

//
//  ViewController.m
//  image
//
//  Created by 韩占森 on 2018/4/26.
//  Copyright © 2018年 韩占森. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) UIButton* actionButton;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    
    [self.view addSubview:self.actionButton];
    
    //第一次提交
    
    //第二次提交
    self.view.backgroundColor = [UIColor redColor];
    
    //第三次提交
    
}

- (void)actionButtonAction:(UIButton *)sender
{
    CGRect frame = self.tableView.frame;
    frame.size.height = self.tableView.contentSize.height;
    self.tableView.frame = frame;
    
    UIGraphicsBeginImageContext(self.tableView.bounds.size);
    [self.tableView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *saveImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    NSData *imageData = UIImagePNGRepresentation(saveImage);
    NSFileManager *fileMan = [NSFileManager defaultManager];
    
    NSString *fileName = [NSString stringWithFormat:@"%d.png",1];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *pdfFileName = [documentsDirectory stringByAppendingPathComponent:fileName];
    [fileMan createFileAtPath:pdfFileName contents:imageData attributes:nil];
    
    NSLog(@"%@", documentsDirectory);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row % 2) {
        return 50;
    }else
    {
        return 100;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(UITableViewCell.class) forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"测试%zi", indexPath.row];
    cell.imageView.image = [UIImage imageNamed:@"service_list_icon"];
    cell.detailTextLabel.text = @"sdfsdfsgaasdfsd";
    return cell;
}


- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 375, 667) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:UITableViewCell.class forCellReuseIdentifier:NSStringFromClass(UITableViewCell.class)];
    }
    return _tableView;
}

- (UIButton *)actionButton
{
    if (!_actionButton) {
        _actionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _actionButton.frame = CGRectMake(300, 100, 50, 50);
        [_actionButton setTitle:@"生成" forState:UIControlStateNormal];
        [_actionButton addTarget:self action:@selector(actionButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        _actionButton.backgroundColor = [UIColor redColor];
    }
    return _actionButton;
}


@end

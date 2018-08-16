//
//  HZSPopViewController.m
//  伴旅
//
//  Created by 灿灿 on 2017/12/15.
//  Copyright © 2017年 灿灿. All rights reserved.
//

#import "HZSPopViewController.h"
#import "HZSLanguage.h"

@interface HZSPopViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *languageArray;

@end

@implementation HZSPopViewController

- (NSMutableArray *)languageArray {
    if (!_languageArray) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"HZSLanguage.plist" ofType:nil];
        _languageArray = [NSMutableArray arrayWithContentsOfFile:path];
        
        NSMutableArray *dictArray = [NSMutableArray array];
        for (NSDictionary *dict in _languageArray) {
            HZSLanguage *language = [HZSLanguage languageWithDict:dict];
            
            [dictArray addObject:language];
        }
        _languageArray = dictArray;
    }
    return _languageArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 120, 220) style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    self.tableView = tableView;
    tableView.dataSource = self;
    tableView.delegate = self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.languageArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"language";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
    HZSLanguage *language = self.languageArray[indexPath.row];
    
    cell.textLabel.text = language.language;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    HZSLanguage *language = self.languageArray[indexPath.row];
    NSString *title = language.language;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(setBtnTitle:)]) {
        [self.delegate setBtnTitle:title];
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end

//
//  RootViewController.m
//  Suoyin索引
//
//  Created by 李发林 on 2017/1/24.
//  Copyright © 2017年 李发林. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController
- (NSMutableArray *)items{
    if (!_items) {
        self.items = [NSMutableArray array];
    }
    return _items ;
}
//懒加载
- (NSMutableArray *)searchResults{
    if (!_searchResults) {
        self.searchResults = [NSMutableArray arrayWithCapacity:0];
    }
    return _searchResults ;
}
- (NSMutableArray *)searchList{
    if (!searchList) {
        searchList = [NSMutableArray array];
    }
    return searchList;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //初始化背景图
    NSLog(@"--%@",NSHomeDirectory());
    
    
    
    
    [self initBackGroundView];
}
#pragma -mark -functions
-(void)initBackGroundView
{
    self.items=@[@"",@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",@"#"];
    
    Aarray = [[NSMutableArray alloc] initWithObjects:@"",@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",@"#",nil];
    
    //tableView
    tableview = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableview.tag = 101;
    tableview.delegate = self;
    tableview.dataSource = self;
    [self.view addSubview:tableview];
    
    //searchView
//    searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 44)];
//    tableview.tableHeaderView = searchBar;
//    searchBar.showsScopeBar = YES;
//    searchBar.placeholder = @"搜索";
//    
//    //搜索的时候会有左侧滑动的效果
//    searchControl = [[UISearchDisplayController alloc]initWithSearchBar:searchBar contentsController:self];
//    searchControl.delegate = self;
//    searchControl.searchResultsDataSource = self;
//    searchControl.searchResultsDelegate = self;
//    self.searchController.searchResultsUpdater=self;

    self.searchController = [[UISearchController alloc]initWithSearchResultsController:nil];
    self.searchController.searchBar.frame = CGRectMake(0, 0, 0, 44);
    self.searchController.dimsBackgroundDuringPresentation = false;
    //搜索栏表头视图
    tableview.tableHeaderView = self.searchController.searchBar;
    [self.searchController.searchBar sizeToFit];
    //背景颜色
    self.searchController.searchBar.backgroundColor = [UIColor orangeColor];
    self.searchController.searchResultsUpdater = self;
    
}
#pragma -mark -searchbar
-(void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope
{
    NSLog(@"111");
}
-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index

{
    
    NSLog(@"===%@  ===%ld",title,(long)index);
    
    //点击索引，列表跳转到对应索引的行
    
    [tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:index] atScrollPosition:UITableViewScrollPositionTop animated:YES];
    
    //弹出首字母提示
    
    //[self showLetter:title ];
    
    return index;
    
}

#pragma -mark -UISearchResultsUpdating
-(void)updateSearchResultsForSearchController:(UISearchController *)searchController{
//     [self.searchResults removeAllObjects];
//    //获取搜索框中用户输入的字符串
//    NSString *searchString = [searchController.searchBar text];
//    //指定过滤条件，SELF表示要查询集合中对象，contain[c]表示包含字符串，%@是字符串内容
//    NSPredicate *searchPredicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@", searchString];
//    //通过过滤条件过滤数据
//    self.searchResults = [[self.items filteredArrayUsingPredicate:searchPredicate]mutableCopy];
//    //刷新表格
//    [tableview reloadData];
    
    for (NSString *string in Aarray)
    {
        if ([string rangeOfString:[searchController.searchBar text]].location !=NSNotFound) {
            
            NSLog(@"meiyou");
        }
        else
        {
//            NSInteger *inter=nil;
           // for (int i=0; i<Aarray.count-1; i++) {
                //[self tableView:tableview sectionForSectionIndexTitle:@"" atIndex:i];
                
               //[tableview scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:i] atScrollPosition:UITableViewScrollPositionTop animated:YES];
                //[tableview reloadData];
                
                NSLog(@"you");
           
            
            }
            
            
        }
     
        
        
        
    }
   
#pragma -mark -UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 28;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40.0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * strID = @"ID";
    UITableViewCell * cell = [tableview dequeueReusableCellWithIdentifier:strID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:strID];
    }
    
    cell.textLabel.text=[NSString stringWithFormat:@"%ld",(long)indexPath.row];
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"这是第%@区",Aarray[section]];
}
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return [NSArray arrayWithObjects:UITableViewIndexSearch,@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",@"#", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

//
//  RootViewController.h
//  Suoyin索引
//
//  Created by 李发林 on 2017/1/24.
//  Copyright © 2017年 李发林. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController
<UITableViewDelegate,UITableViewDataSource,UISearchDisplayDelegate,UISearchBarDelegate,UISearchResultsUpdating>
{
    UITableView * tableview;
    NSMutableArray * Aarray;
    UISearchBar * searchBar;
    NSMutableArray * searchList;
    UISearchDisplayController *searchControl;
    
}
@property(nonatomic,retain)NSMutableArray *items;
@property(nonatomic,retain)UISearchController *searchController;
@property(nonatomic,retain)NSMutableArray *searchResults;
@end

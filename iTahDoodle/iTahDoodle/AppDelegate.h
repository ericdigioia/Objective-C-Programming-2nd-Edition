//
//  AppDelegate.h
//  iTahDoodle
//
//  Created by Eric Di Gioia on 7/28/22.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder
    <UIApplicationDelegate, UITableViewDataSource>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic) UITableView *taskTable;
@property (nonatomic) UITextField *taskField;
@property (nonatomic) UIButton *insertButton;

@property (nonatomic) NSMutableArray *tasks;

- (void)addTask:(id)sender;

@end


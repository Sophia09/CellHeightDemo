//
//  ViewController1.m
//  CellHeightDemo
//
//  Created by thinkit  on 10/24/14.
//  Copyright (c) 2014 thinkit . All rights reserved.
//

#import "ViewController1.h"
#import "C1.h"
#import "C2.h"
#import "C5.h"

@interface ViewController1 ()

@property (retain, nonatomic) NSMutableArray *tableData;
@property (retain, nonatomic) UITableViewCell *prototypeCell;

@end


@implementation ViewController1


@synthesize tableData;
@synthesize prototypeCell;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.tableData = [NSMutableArray arrayWithArray:@[@ "1\n2\n3\n4\n5\n6",
                                                        @ "123456789012345678901234567890",
                                                        @ "1\n2",
                                                        @ "1\n2\n3",
                                                        @ "1"]];;
    
//    self.prototypeCell = [self.tableView dequeueReusableCellWithIdentifier:@"C1"];
    
//    self.prototypeCell = [self.tableView dequeueReusableCellWithIdentifier:@"C2"];
    
    UINib *c5Nib = [UINib nibWithNibName:@"C5" bundle:nil];
    [self.tableView registerNib:c5Nib forCellReuseIdentifier:@"C5"];

    self.prototypeCell = [self.tableView dequeueReusableCellWithIdentifier:@"C5"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    static NSString *CellIdentifier = @"C1";
//    C1 *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
//    
//    // Configure the cell...
//    cell.label.text = [self.tableData objectAtIndex:indexPath.row];
    
    
//    static NSString *CellIdentifier = @"C2";
//    C2 *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    
//    //Configure the cell
//    cell.textView.text = [self.tableData objectAtIndex:indexPath.row];
    
    static NSString *CellIdentifier = @"C5";
    C5 *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    //Configure the cell
    cell.textView.text = [self.tableData objectAtIndex:indexPath.row];
    cell.textView.delegate = self;
    cell.textView.tag = indexPath.row;

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    C1 *cell = (C1 *)self.prototypeCell;
//    cell.label.text = [self.tableData objectAtIndex:indexPath.row];
//    CGSize size = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
//    NSLog(@ "h=%f" , size.height + 1);
//      return  1  + size.height;
    
//    C2 *cell = (C2 *)self.prototypeCell;
//    cell.textView.text = [self.tableData objectAtIndex:indexPath.row];
//    
//    CGSize contentViewSize = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
//    
//    CGSize textViewSize = [cell.textView sizeThatFits:CGSizeMake(cell.textView.frame.size.width, 200)];
    
//    return contentViewSize.height +  textViewSize.height + 1;
 
    C5 *cell = (C5 *)self.prototypeCell;
    
    cell.textView.text = [self.tableData objectAtIndex:indexPath.row];
    
    CGSize textViewSize = [cell.textView sizeThatFits:CGSizeMake(cell.textView.frame.size.width, FLT_MAX)];

    CGFloat defaultHeight = cell.contentView.frame.size.height;
    
    CGFloat height = textViewSize.height > defaultHeight ? textViewSize.height : defaultHeight;
    
    NSLog(@"row = %d textView height = %f, defaulut height = %f", indexPath.row, textViewSize.height, defaultHeight);
    return 1 + height;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

#pragma mark - UITextViewDelegate

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"])
    {
        NSLog(@"h = %f", textView.contentSize.height);
    }
    return YES;
}

- (void)textViewDidChange:(UITextView *)textView
{
    int rowIndex = textView.tag;
    [self.tableData replaceObjectAtIndex:rowIndex withObject:textView.text];
    [self.tableView beginUpdates];
    [self.tableView endUpdates];
}

@end

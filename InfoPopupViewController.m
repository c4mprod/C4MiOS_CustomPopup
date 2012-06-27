/*******************************************************************************
 * This file is part of the C4MiOS_CustomPopup project.
 * 
 * Copyright (c) 2012 C4M PROD.
 * 
 * C4MiOS_CustomPopup is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * C4MiOS_CustomPopup is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public License
 * along with C4MiOS_CustomPopup. If not, see <http://www.gnu.org/licenses/lgpl.html>.
 * 
 * Contributors:
 * C4M PROD - initial API and implementation
 ******************************************************************************/
 
#import "InfoPopupViewController.h"


@implementation InfoPopupViewController

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/
-(IBAction)end:(id)sender
{
	NSLog(@"end");
}
-(IBAction)onexit:(id)sender
{
	NSLog(@"onexit");
}
-(IBAction)begin:(id)sender
{
	NSLog(@"begin");
}
-(IBAction)change:(id)sender
{
	NSLog(@"change");
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
	NSLog(@"textFieldShouldBeginEditing");
	return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
	NSLog(@"textFieldDidBeginEditing");
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
	NSLog(@"textFieldShouldEndEditing");
	return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
	NSLog(@"textFieldDidEndEditing");
}


-(IBAction)cancelButton:(UIButton*)button
{
	//[self.parentViewController hide];
	[C4MPopup hideCustomPopupWithClickedButtonIndex:0];
}

-(void)viewDidAppear:(BOOL)animated
{
	
	[super viewDidAppear:animated];
}

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end

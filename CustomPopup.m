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
 
#import "CustomPopup.h"
//#import "UIView+TKCategory.h"


@implementation CustomPopup
@synthesize mCustomViewController;

- (id) initWithViewController:(UIViewController*)_customViewController{
	if(![super init]) return nil;
	self.tag=_customViewController.view.tag;
	mCustomViewController = [_customViewController retain];

	return self;
}

- (void) layoutSubviews {
	
	for(UIView* tmp in self.subviews)
	{
		[tmp removeFromSuperview];
	}
	[self addSubview:mCustomViewController.view];
	
	
	CGRect textRect = mCustomViewController.view.frame;
	textRect.origin.x = (CGRectGetWidth(self.bounds) - CGRectGetWidth(textRect)) / 2;
	textRect.origin.y = (CGRectGetHeight(self.bounds) - CGRectGetHeight(textRect)) / 2;

	
	mCustomViewController.view.frame = textRect;
	
    //DAM: removed
	//UITextField* textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
	//[self addSubview:textField];

}

- (void) drawRect:(CGRect)rect{
	//CGSize imageSize = self.backgroundImage.size;
   // [self.backgroundImage drawInRect:CGRectMake(0, 0, imageSize.width, imageSize.height)];
	
	//CGRect r = CGRectInset(rect, 6, 0);
	//[UIView drawRoundRectangleInRect:r withRadius:10 color:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.8]];
}

- (void) show {
	[self resignFirstResponder];
	[super show];
	self.bounds = CGRectMake(0, 0, mCustomViewController.view.frame.size.width, mCustomViewController.view.frame.size.height);

}


- (void) hideWithClickedButtonIndex:(NSUInteger)index
{
	[self dismissWithClickedButtonIndex:index animated:YES];
}

- (void)dealloc {
	[mCustomViewController.view removeFromSuperview];
	[mCustomViewController release];
	[super dealloc];
}


@end

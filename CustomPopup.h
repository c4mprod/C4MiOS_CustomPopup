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
 
#import <UIKit/UIKit.h>

@interface CustomPopup : UIAlertView {
	UIViewController* mCustomViewController;
}

@property (nonatomic, retain) UIViewController* mCustomViewController;

- (id) initWithViewController:(UIViewController*)_customViewController;
- (void) show;
- (void) hideWithClickedButtonIndex:(NSUInteger)index;

@end

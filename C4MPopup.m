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

#import "C4MPopup.h"
#import "CustomPopup.h"

@implementation C4MPopup

 CustomPopup* mCustomPopup = nil;
 CustomPopup* mLoadingPopup = nil;
 UIProgressView* mProgress = nil;

+(void)showCustomPopup:(UIViewController*)_popupViewController withDelegate:(NSObject<UIAlertViewDelegate>*)_delegate
{
	if(mCustomPopup == nil)
	{
		mCustomPopup = [[CustomPopup alloc] initWithViewController:_popupViewController];
		mCustomPopup.delegate=_delegate;
		[mCustomPopup show];
	}
}


+(void)showLoadingPopupWithBorder:(BOOL)_shadow WithBakgroundColor:(UIColor*)_backgroundColor AndTextColor:(UIColor*)_textColor ForText:(NSString*)_text InfiniteMode:(BOOL)_infinite
{
	if(mLoadingPopup==nil)
	{
		UIViewController* tmpViewController = [[UIViewController alloc] init];
	
		UIFont* tmpFont = [UIFont fontWithName:@"Arial" size:17];
		CGSize tmpSize = [_text sizeWithFont:tmpFont constrainedToSize:CGSizeMake(200, 9999)];
	
		CGRect textRect = CGRectMake(20, 30, 200, tmpSize.height);;
		if(_infinite)
		{
			textRect.origin.y+=50;
		}	
	
		UILabel* tmpLabel = [[UILabel alloc] initWithFrame:textRect];
		tmpLabel.font=tmpFont;
		tmpLabel.numberOfLines=10;
		tmpLabel.textAlignment=UITextAlignmentCenter;
		tmpLabel.textColor=_textColor;
		tmpLabel.text=_text;
		tmpLabel.backgroundColor=[UIColor clearColor];
		
		tmpSize.height+=100;
		
		UIView* tmpLoadingView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 240, tmpSize.height)];
		tmpLoadingView.layer.cornerRadius = 10;

		/*
		if(_shadow)
		{
			UIView* tmpBorder =[[UIView alloc] initWithFrame:CGRectMake(2, 2, 236, tmpSize.height-4)];
			tmpBorder.layer.cornerRadius = 10;
			tmpBorder.backgroundColor=[_backgroundColor colorWithAlphaComponent:0.6];
			tmpLoadingView.backgroundColor=[UIColor colorWithWhite:1 alpha:0.9];
			[tmpLoadingView addSubview:tmpBorder];
			[tmpBorder release];
			
			
		}
		else
		{
			tmpLoadingView.backgroundColor=[_backgroundColor colorWithAlphaComponent:0.75] ;
		}
		*/
		
		UIImageView *tmpImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 240, tmpSize.height)];
		[tmpImg setContentMode:UIViewContentModeScaleAspectFit];
		tmpImg.image = [UIImage imageNamed:@"alert_background.png"];
		[tmpLoadingView addSubview:tmpImg];
		[tmpImg release];
		
		[tmpLoadingView addSubview:tmpLabel];
		[tmpLabel release];
		
		
		if(_infinite)
		{
			UIActivityIndicatorView* tmpActivity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
			tmpActivity.frame = CGRectMake(102, 30, 36, 36);
			[tmpActivity startAnimating];
			[tmpLoadingView addSubview:tmpActivity];
			[tmpActivity release];
		}
		else
		{
			mProgress = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleBar];
			mProgress.frame = CGRectMake(20, tmpSize.height-40, 200, 11);
			mProgress.progress=0;
			[tmpLoadingView addSubview:mProgress];
			[mProgress release];
		}


		tmpViewController.view = tmpLoadingView;
		[tmpLoadingView release];
		
		mLoadingPopup = [[CustomPopup alloc] initWithViewController:tmpViewController];
		[mLoadingPopup show];

		[tmpViewController release];
	}
}

+(void)setProgress:(float)_progress
{
	if(mProgress!=nil)
		mProgress.progress=_progress;
}
+(float)progress
{
	if(mProgress!=nil)
		return mProgress.progress;
	else 
		return -1;
}

+(void)hideLoadingPopup
{
	[mLoadingPopup hideWithClickedButtonIndex:0];
	[mLoadingPopup release];
	mLoadingPopup=nil;
}

+(void)hideCustomPopupWithClickedButtonIndex:(NSUInteger)_index
{
	[mCustomPopup hideWithClickedButtonIndex:_index];
	[mCustomPopup release];
	mCustomPopup=nil;
}

@end

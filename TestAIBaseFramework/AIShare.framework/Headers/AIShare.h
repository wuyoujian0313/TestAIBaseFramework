//
//  AIBase.h
//  AIBase
//
//  Created by wuyoujian on 16/7/18.
//  Copyright © 2016年 Asiainfo. All rights reserved.
//

#import <UIKit/UIKit.h>

// 1、为了避免类文件冲突，请注意以下：
// 1.1）微信的sdk，不能引入.a文件，也需要引入头文件是使编译连接通过就可以了；
// 1.2) 再单独使用AIShare.framework的app工程，使用<AIShare/AIShare.h>或预先定义宏AISHARE

#ifndef AIShare_h
#define AIShare_h

#ifndef AISHARE
#define AISHARE 1
#endif

#import <AIShare/SharedDataModel.h>
#import <AIShare/SharedManager.h>
#import <AIShare/AIActionSheet.h>

#endif




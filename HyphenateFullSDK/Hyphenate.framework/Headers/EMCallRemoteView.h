

/*!
 *  \~chinese
 *  @header EMCallRemoteView.h
 *  @abstract 视频通话对方图像显示页面
 *  @author Hyphenate
 *  @version 3.00
 *
 *  \~english
 *  @header EMCallRemoteView.h
 *  @abstract Video call remote view
 *  @author Hyphenate
 *  @version 3.00
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#ifndef EM_SCALEASPECT_DEFINE
#define EM_SCALEASPECT_DEFINE
typedef enum{
    EMCallViewScaleModeAspectFit = 0,
    EMCallViewScaleModeAspectFill = 1
}EMCallViewScaleMode;
#endif

@interface EMCallRemoteView : UIView

/*!
 *  \~chinese
 *  视频通话页面缩放方式
 *
 *  \~english
 *  Video view scale mode
 */
@property (atomic, assign) EMCallViewScaleMode scaleMode;
@property (atomic, assign) BOOL previewDirectly;

- (CGPoint) getInterestForUIPoint:(CGPoint)point;
@end


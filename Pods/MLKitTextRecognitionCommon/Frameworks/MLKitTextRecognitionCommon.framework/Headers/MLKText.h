#import <Foundation/Foundation.h>

@class MLKTextBlock;

NS_ASSUME_NONNULL_BEGIN

/** Recognized text in an image. */
NS_SWIFT_NAME(Text)
@interface MLKText : NSObject

/** The recognized text. The string is empty if no text was recognized. */
@property(nonatomic, readonly) NSString *text;

/** An array of blocks recognized in the text. */
@property(nonatomic, readonly) NSArray<MLKTextBlock *> *blocks;

/** Unavailable. */
- (instancetype)init NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END

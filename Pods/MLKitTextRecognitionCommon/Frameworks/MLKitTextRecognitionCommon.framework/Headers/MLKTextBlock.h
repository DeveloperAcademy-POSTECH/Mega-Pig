#import <CoreGraphics/CoreGraphics.h>
#import <Foundation/Foundation.h>

@class MLKTextLine;
@class MLKTextRecognizedLanguage;

NS_ASSUME_NONNULL_BEGIN

/** A text block recognized in an image that consists of an array of text lines. */
NS_SWIFT_NAME(TextBlock)
@interface MLKTextBlock : NSObject

/** String representation of the text block that was recognized. */
@property(nonatomic, readonly) NSString *text;

/** An array of text lines that make up the block. */
@property(nonatomic, readonly) NSArray<MLKTextLine *> *lines;

/**
 * The rectangle that contains the text block relative to the image in the default coordinate space.
 */
@property(nonatomic, readonly) CGRect frame;

/**
 * An array of recognized languages in the text block. If no languages were recognized, the array is
 * empty.
 */
@property(nonatomic, readonly) NSArray<MLKTextRecognizedLanguage *> *recognizedLanguages;

/**
 * The four corner points of the text block in clockwise order starting with the top left point
 * relative to the image in the default coordinate space. The `NSValue` objects are `CGPoint`s.
 */
@property(nonatomic, readonly) NSArray<NSValue *> *cornerPoints;

/** Unavailable. */
- (instancetype)init NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END

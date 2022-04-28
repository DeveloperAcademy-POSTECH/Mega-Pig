#import <CoreGraphics/CoreGraphics.h>
#import <Foundation/Foundation.h>

@class MLKTextRecognizedLanguage;

NS_ASSUME_NONNULL_BEGIN

/**
 * A text element recognized in an image. A text element is a space-separated segment in a text
 * line (for example, a word in most Latin-script languages).
 */
NS_SWIFT_NAME(TextElement)
@interface MLKTextElement : NSObject

/** String representation of the text element that was recognized. */
@property(nonatomic, readonly) NSString *text;

/**
 * The rectangle that contains the text element relative to the image in the default coordinate
 * space.
 */
@property(nonatomic, readonly) CGRect frame;

/**
 * An array of recognized languages in the text element. If no languages were recognized, the array
 * is empty.
 */
@property(nonatomic, readonly) NSArray<MLKTextRecognizedLanguage *> *recognizedLanguages;

/**
 * The four corner points of the text element in clockwise order starting with the top left point
 * relative to the image in the default coordinate space. The `NSValue` objects are `CGPoint`s.
 */
@property(nonatomic, readonly) NSArray<NSValue *> *cornerPoints;

/** Unavailable. */
- (instancetype)init NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END

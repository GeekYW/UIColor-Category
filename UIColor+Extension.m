

#import "UIColor+Extension.h"

@implementation UIColor (Extension)

+ (UIColor *)convertRGB:(NSString *)color {
    
//    将一个 NSString = @“#FF0000”转换成 RGB的方法
    
//    NSString *color = @"#FF0000";
    
    NSMutableString *colorString = [NSMutableString stringWithFormat:color];
    // 转换成标准16进制数
    [colorString replaceCharactersInRange:[color rangeOfString:@"#" ] withString:@"0x"];
    
    DddLog(@"%@", colorString);
//    [color ];
    
    // 十六进制字符串转成整形。
    long colorLong = strtoul([colorString cStringUsingEncoding:NSUTF8StringEncoding], 0, 16);
    
    DddLog(@"%ld", colorLong);
    // 通过位与方法获取三色值
    int R = (colorLong & 0xFF0000 )>>16;
    int G = (colorLong & 0x00FF00 )>>8;
    int B =  colorLong & 0x0000FF;
    
    DddLog(@"%i--%i--%i", R, G, B);
    //string转color
//    UIColor *wordColor = [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1.0];
    
    UIColor *wordColor = YWColor(R, G, B);
    
    DddLog(@"%@", wordColor);
    return wordColor;
}

@end

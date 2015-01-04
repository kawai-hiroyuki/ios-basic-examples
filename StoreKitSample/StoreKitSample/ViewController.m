//
//  ViewController.m
//  StoreKitSample
//
//  Created by obumin on 2014/12/29.
//  Copyright (c) 2014年 Kawai Hiroyuki. All rights reserved.
//
//  購入テストは実機でないと確認できない

#import "ViewController.h"
#import <StoreKit/StoreKit.h>
#import "MyStoreObserver.h"

@interface ViewController () <SKProductsRequestDelegate, SKPaymentTransactionObserver>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    SKProductsRequest *request= [[SKProductsRequest alloc]
                                 initWithProductIdentifiers: [NSSet setWithObjects: @"adfree", @"GameItem", nil]];
    request.delegate = self;
    [request start];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 情報の取得が完了した場合
- (void)productsRequest:(SKProductsRequest *)request
     didReceiveResponse:(SKProductsResponse *)response
{
    NSLog(@"productsRequest");
    NSArray *products = response.products;
    for (SKProduct *product in products) {
        NSLog(@"localizedDescription:%@", product.localizedDescription);
        NSLog(@"localizedTitle:%@", product.localizedTitle);
        NSLog(@"price:%f", [product.price doubleValue]);
        
        // iphone - How to access the price of a product in SKPayment? - Stack Overflow
        // http://stackoverflow.com/questions/2894321/how-to-access-the-price-of-a-product-in-skpayment
        NSLog(@"priceLocale(NSLocaleCurrencySymbol):%@", [product.priceLocale objectForKey:NSLocaleCurrencySymbol]);
        NSLog(@"priceLocale(NSLocaleCountryCode):%@", [product.priceLocale objectForKey:NSLocaleCountryCode]);
        NSLog(@"productIdentifier:%@", product.productIdentifier);
        
        if ([product.productIdentifier isEqualToString:@"adfree"]) {
            // adfreeの場合は支払いに進む
            [self payment:product];
        }
    }
}

// リクエストが失敗した場合
- (void)request:(SKRequest *)request didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError");
}

- (void)payment:(SKProduct *)product
{
    NSLog(@"Payment:%@", product.localizedTitle);
    
    if (![SKPaymentQueue canMakePayments]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"エラー"
                                                        message:@"アプリ内課金が制限されています。"
                                                       delegate:nil
                                              cancelButtonTitle:nil
                                              otherButtonTitles:@"OK", nil];
        [alert show];
        return;
    } else {
        NSLog(@"[SKPaymentQueue canMakePayments] == YES");
    }
    
    SKPayment *payment = [SKPayment paymentWithProduct:product];
//    [[SKPaymentQueue defaultQueue] addTransactionObserver:
//     [[MyStoreObserver alloc] init]];
    [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
    [[SKPaymentQueue defaultQueue] addPayment:payment];

}


#pragma mark -
#pragma mark SKPaymentTransactionObserver
- (void)paymentQueue:(SKPaymentQueue *)queue
 updatedTransactions:(NSArray *)transactions {
    for (SKPaymentTransaction *transaction in transactions)
    {
        switch (transaction.transactionState)
        {
            case SKPaymentTransactionStatePurchasing:
                // 購入処理中
                NSLog(@"Purchasing. %@", transaction);
                break;
            case SKPaymentTransactionStatePurchased:
                NSLog(@"purchased. %@", transaction);
                NSLog(@"transaction.payment.productIdentifier=%@", transaction.payment.productIdentifier);
                break;
            case SKPaymentTransactionStateFailed:
                NSLog(@"transaction failed. %@", transaction.error);
                break;
            case SKPaymentTransactionStateRestored:
                NSLog(@"transaction restored.");
                // リストア処理完了
                // アイテムの再付与を行う
                [queue finishTransaction:transaction];
            default:
                break;
        }
    }
}

// Sent when transactions are removed from the queue (via finishTransaction:).
- (void)paymentQueue:(SKPaymentQueue *)queue removedTransactions:(NSArray *)transactions
{
    NSLog(@"removedTransactions");
}

// Sent when an error is encountered while adding transactions from the user's purchase history back to the queue.
- (void)paymentQueue:(SKPaymentQueue *)queue restoreCompletedTransactionsFailedWithError:(NSError *)error
{
    NSLog(@"restoreCompletedTransactionsFailedWithError");
}
// Sent when all transactions from the user's purchase history have successfully been added back to the queue.
- (void)paymentQueueRestoreCompletedTransactionsFinished:(SKPaymentQueue *)queue
{
    NSLog(@"paymentQueueRestoreCompletedTransactionsFinished");
}

// Sent when the download state has changed.
- (void)paymentQueue:(SKPaymentQueue *)queue updatedDownloads:(NSArray *)downloads
{
    NSLog(@"updatedDownloads");
}

@end

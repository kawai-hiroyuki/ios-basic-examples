//
//  MyStoreObserver.m
//  StoreKitSample
//
//  Created by obumin on 2014/12/29.
//  Copyright (c) 2014年 Kawai Hiroyuki. All rights reserved.
//

#import "MyStoreObserver.h"

@implementation MyStoreObserver

- (void)paymentQueue:(SKPaymentQueue *)queue
 updatedTransactions:(NSArray *)transactions {
    for (SKPaymentTransaction *transaction in transactions)
    {
        switch (transaction.transactionState)
        {
            case SKPaymentTransactionStatePurchased:
                NSLog(@"purchased. %@", transaction);
                break;
            case SKPaymentTransactionStateFailed:
                NSLog(@"transaction failed. %@", transaction.error);
                break;
            case SKPaymentTransactionStateRestored:
                NSLog(@"transaction restored.");
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

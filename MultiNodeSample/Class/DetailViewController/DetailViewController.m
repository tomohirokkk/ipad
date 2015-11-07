//
//  DetailViewController.m
//  MultiNodeSample
//
//  Created by Akira Matsuda on 2/10/15.
//  Copyright (c) 2015 Akira Matsuda. All rights reserved.
//

#import "DetailViewController.h"
#import "Konashi.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *sendDataTextField;


@end


@implementation DetailViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	self.title = @"Stars-E model command list";
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"12.png"]];
}


- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	[[KNSCentralManager sharedInstance].activePeripherals enumerateObjectsUsingBlock:^(KNSPeripheral *p, BOOL *stop) {
		[p uartMode:KonashiUartModeEnable baudrate:KonashiUartBaudrateRate9K6];
		[p setUartRxCompleteHandler:^(NSData *data) {
			NSString *string = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
			NSLog(@"uart RX complete:%@(length = %ld:%@)", string, (unsigned long)data.length, [data description]);
		}];
	}];
}

- (IBAction)go:(id)sender {
    [[KNSCentralManager sharedInstance].activePeripherals enumerateObjectsUsingBlock:^(KNSPeripheral *p, BOOL *stop) {
        [p uartWrite:'g'];
    }];
}

- (IBAction)back:(id)sender {
    [[KNSCentralManager sharedInstance].activePeripherals enumerateObjectsUsingBlock:^(KNSPeripheral *p, BOOL *stop) {
        [p uartWrite:'d'];
    }];
    
}

- (IBAction)brake:(id)sender {
    [[KNSCentralManager sharedInstance].activePeripherals enumerateObjectsUsingBlock:^(KNSPeripheral *p, BOOL *stop) {
        [p uartWrite:'b'];
    }];
}

- (IBAction)emergency:(id)sender {
    [[KNSCentralManager sharedInstance].activePeripherals enumerateObjectsUsingBlock:^(KNSPeripheral *p, BOOL *stop) {
        [p uartWrite:'e'];
    }];
}


- (IBAction)Voltage:(id)sender {
    [[KNSCentralManager sharedInstance].activePeripherals enumerateObjectsUsingBlock:^(KNSPeripheral *p, BOOL *stop) {
        [p uartWrite:'v'];
    }];
}

- (IBAction)Senser:(id)sender {
    [[KNSCentralManager sharedInstance].activePeripherals enumerateObjectsUsingBlock:^(KNSPeripheral *p, BOOL *stop) {
        [p uartWrite:'s'];
    }];
}

- (IBAction)Reset:(id)sender {
    [[KNSCentralManager sharedInstance].activePeripherals enumerateObjectsUsingBlock:^(KNSPeripheral *p, BOOL *stop) {
        [p uartWrite:'r'];
    }];
}

@end

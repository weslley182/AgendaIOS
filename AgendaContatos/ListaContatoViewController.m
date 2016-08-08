//
//  ListaContatoViewController.m
//  AgendaContatos
//
//  Created by Mac on 8/7/16.
//  Copyright © 2016 Mac. All rights reserved.
//

#import "ListaContatoViewController.h"
#import "Contato.h"

@interface ListaContatoViewController ()

@end

@implementation ListaContatoViewController

-(id) init{
    self = [super init];
    if(self){
        UIBarButtonItem *botaoForm = [[UIBarButtonItem alloc]
                                  initWithBarButtonSystemItem:UIBarButtonSystemItemAdd                   target:self action:@selector(exibirFormulario)];
    
        self.navigationItem.rightBarButtonItem = botaoForm;
        self.navigationItem.title = @"Lista de contatos";
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem;
        [self inicializarLinha];
        self.contatoDAO = [ContatoDAO contatoDaoInstance];
    }
    return self;
}

-(void)inicializarLinha{
    self.linhaSelecionada = -1;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if(editingStyle == UITableViewCellEditingStyleDelete){
        [self removerItemTela:indexPath];
    }
}

-(void)removerItemTela:(NSIndexPath *)pnIndex{
    Contato *contato = [self.contatoDAO contatoDoIndice:pnIndex.row];
    [self.contatoDAO removerContato:contato];
    [self.tableView deleteRowsAtIndexPaths: @[pnIndex] withRowAnimation:UITableViewRowAnimationFade];
}

-(void)tableView:(nonnull UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    self.contatoSelecionado = [self.contatoDAO contatoDoIndice:indexPath.row];
    [self exibirFormulario];
}

-(void) exibirFormulario{
    UIStoryboard *storyB = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *form = [storyB instantiateViewControllerWithIdentifier:@"Form-Contato"];
    form.delegate = self;
    if(self.contatoSelecionado){
        form.contato = self.contatoSelecionado;
    }
    self.contatoSelecionado = nil;
    [self.navigationController pushViewController:form animated:YES];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.contatoDAO totalContatos];
}

-(nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:
(nonnull NSIndexPath *)indexPath{
    
    NSString *identificador = @"Celula";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:identificador];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identificador];
    }
    Contato *contato = [self.contatoDAO contatoDoIndice:indexPath.row];
    cell.textLabel.text = contato.nome;
    
    return cell;
}

-(void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}

-(void)contatoAdicionado:(Contato *)poContato{
    self.linhaSelecionada = [self.contatoDAO indiceDoContato:poContato];
    NSString *sMensagem = [NSString stringWithFormat:@"Contato %@ adicionado com sucesso.",
                           poContato.nome];
    UIAlertController *alerta = [UIAlertController alertControllerWithTitle:@"Contato adicionado" message:sMensagem preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:nil];
    [alerta addAction:ok];
    
    [self presentViewController:alerta animated:YES completion:nil];
    NSLog(@"Adicionado: %@", poContato);
}

-(void)contatoAtualizado:(Contato *)poContato{
    self.linhaSelecionada = [self.contatoDAO indiceDoContato:poContato];
    NSLog(@"Atualizado: %@", poContato);
}

-(void)viewDidAppear:(BOOL)animated{
    NSIndexPath *indexpath = [NSIndexPath indexPathForRow:self.linhaSelecionada inSection:0];
    [self.tableView selectRowAtIndexPath:indexpath animated:YES scrollPosition:UITableViewScrollPositionNone];
    [self inicializarLinha];
}

@end

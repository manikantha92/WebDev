import React from 'react';
import ReactDOM from 'react-dom';
import {Button} from 'reactstrap';

export default function run_demo(root) {
  ReactDOM.render(<Layout />, root);
}

function shuffle(a) {
    var j, x, i;
    for (i = a.length - 1; i > 0; i--) {
        j = Math.floor(Math.random() * (i + 1));
        x = a[i];
        a[i] = a[j];
        a[j] = x;
    }
}

const gameStatesEnum = {
WFTFC: "Waiting_for_the_first_card", WFTSC:  "waiting_for_the_second_card", WRONG: "wrong"
};

function createArray(x,y) {
return Array.apply(null,Array(x)).map(function(e){
	return Array(y);
});
}

function startGame() {
var cards = createArray(4,4);
var alphabets =["A", "B", "C","D","E","F","G","H","A", "B", "C","D","E","F","G","H"];
shuffle(alphabets);
var cardNumber = 0;
for(var rowIndex=0; rowIndex<4; rowIndex++){
for(var columnIndex=0; columnIndex<4; columnIndex++){
cards[rowIndex][columnIndex] = {cardValue: alphabets[cardNumber], flipped:false, rowIndex:rowIndex, columnIndex:columnIndex};
cardNumber++;
}

}
return cards;
}
class Card extends React.Component {
  render() {
  return <div className="card"> <span>{this.props.card.flipped?this.props.card.cardValue:"#"}</span></div>;
  }
}

class Layout extends React.Component {
constructor(props) {
super(props);

	this.state = {cards: startGame(), gameState: gameStatesEnum.WFTFC, firstCard: null, secondCard: null,clickCount:0};
}
cardClick(card){
if(!card.flipped) {

switch(this.state.gameState) {

case gameStatesEnum.WFTFC:
this.state.cards[card.rowIndex][card.columnIndex].flipped=true;
this.setState({cards:this.state.cards, firstCard: card, gameState: gameStatesEnum.WFTSC, clickCount: this.state.clickCount + 1});
break;

case gameStatesEnum.WFTSC:
this.state.cards[card.rowIndex][card.columnIndex].flipped=true;
this.setState({cards:this.state.cards, gameState: gameStatesEnum.WFTFC, clickCount: this.state.clickCount + 1});
if(this.state.firstCard.cardValue==card.cardValue) {

setTimeout(()=>{
   this.state.cards[this.state.firstCard.rowIndex][this.state.firstCard.columnIndex].cardValue = "MML";
            this.state.cards[card.rowIndex][card.columnIndex].cardValue = "MML";
this.setState({cards:this.state.cards, gameState: gameStatesEnum.WFTFC});


},1000)

}else {

setTimeout(()=>{
this.state.cards[this.state.firstCard.rowIndex][this.state.firstCard.columnIndex].flipped=false;
this.state.cards[card.rowIndex]
[card.columnIndex].flipped=false;
this.setState({cards:this.state.cards, firstCard:null, gameState: gameStatesEnum.WFTFC});
},1000)

//this.closeCard(card);
//this.setState({cards:this.state.cards, gameState: //gameStatesEnum.WRONG, secondCard: card});


}
break;

case gameStatesEnum.WRONG:
this.state.cards[this.state.firstCard.rowIndex][this.state.firstCard.collumnIndex].flipped=false;
this.state.cards[this.state.secondCard.rowIndex][this.state.secondCard.collumnIndex].flipped=false;
this.setState({cards:this.state.cards, gameState: gameStatesEnum.WFTFC});
break;
}


}
}
restartGame() {this.setState({cards: startGame(), game: gameStatesEnum.WFTFC, firstCard: null, secondCard: null});
}

render() {
const cardsRendered = this.state.cards.map((rowOfCards,rowIndex)=><tr>{rowOfCards.map((card,indexOfCardInRow)=><td onClick={()=>this.cardClick(card)}><Card card={card}/></td>)}</tr>);
return <div><div>{this.state.gameState}</div><table><tbody>{cardsRendered}</tbody></table>
<div><div><p>No. of clicks:<b>{this.state.clickCount}</b></p></div><button onClick={()=>this.restartGame()}>RESET</button></div></div>
}
}

import React from 'react';
import ReactDOM from 'react-dom';
import {Table, Tr, Td, Button} from 'reactstrap';

export default function run_demo(root) {
  tick,ReactDOM.render(<Layout/>, root);
}

// function to shuffle the array of alphabets
function shuffle(a) {
  var j,
    x,
    i;
  for (i = a.length - 1; i > 0; i--) {
    j = Math.floor(Math.random() * (i + 1));
    x = a[i];
    a[i] = a[j];
    a[j] = x;
  }
}

let clickable = false; // variable to keep track of when to disable the clicks 
let all=0;
const  gameStates = {
  FIRST: "Open the first card",
  SECOND: "Open the second card",
};

const tick = <span>&#10004;</span>; // variable to display a tick


// creating an array
function createArray(x, y) {
  return Array.apply(null, Array(x)).map(function(e) {
    return Array(y);
  });
}


//initializing the game
function startGame() {
  var cards = createArray(4, 4);
  var alphabets = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H"
  ];
  shuffle(alphabets);
  var cardNumber = 0;
  for (var rowIndex = 0; rowIndex < 4; rowIndex++) {
    for (var columnIndex = 0; columnIndex < 4; columnIndex++) {
      cards[rowIndex][columnIndex] = {
        cardValue: alphabets[cardNumber],
        flipped: false,
        rowIndex: rowIndex,
        columnIndex: columnIndex
      };
      cardNumber++;
    }

  }
  return cards;
}

class Card extends React.Component {
  render() {
    return <div className="card">
      <span>{
          this.props.card.flipped
            ? this.props.card.cardValue
            : "?"
        }</span>
    </div>;
  }
}

class Layout extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      cards: startGame(),
      gameState: gameStates.FIRST,
      firstCard: null,
      secondCard: null,
      clickCount: 0
    };
  }

  cardClick(card) {
    if (!card.flipped && !clickable) {

      switch (this.state.gameState) {

        case gameStates.FIRST:
          this.state.cards[card.rowIndex][card.columnIndex].flipped = true;
          this.setState({
            cards: this.state.cards,
            firstCard: card,
            gameState: gameStates.SECOND,
            clickCount: this.state.clickCount + 1
          });
          break;

        case gameStates.SECOND:
          this.state.cards[card.rowIndex][card.columnIndex].flipped = true;
          this.setState({
            cards: this.state.cards,
            gameState: gameStates.FIRST,
            clickCount: this.state.clickCount + 1
          });
          if (this.state.firstCard.cardValue == card.cardValue) {
            clickable = true;

            setTimeout(() => {
              clickable = false;
              this.state.cards[this.state.firstCard.rowIndex][this.state.firstCard.columnIndex].cardValue = tick;
              this.state.cards[card.rowIndex][card.columnIndex].cardValue = tick;
              this.setState({cards: this.state.cards, gameState: gameStates.FIRST});
            }, 1000)
            all = all + 1;
          } else {

            clickable = true;
            setTimeout(() => {
              clickable = false;
              this.state.cards[this.state.firstCard.rowIndex][this.state.firstCard.columnIndex].flipped = false;
              this.state.cards[card.rowIndex]
              [card.columnIndex].flipped = false;
              this.setState({cards: this.state.cards, firstCard: null, gameState: gameStates.FIRST});

            }, 1000)

            break;

          }

      }
    }

  }


  restartGame() {
    this.setState({cards: startGame(), game: gameStates.FIRST, firstCard: null, secondCard: null, clickCount: 0});
  }

  render() {

    if (all == 8) {
      setTimeout(() => {
        all = 0;
     <div>"hello"</div>

      }, 3000)
    }
    const cardsRendered = this.state.cards.map((rowOfCards, rowIndex) =>< tr > {
      rowOfCards.map((card, indexOfCardInRow) =>< td onClick = {
        () => this.cardClick(card)
      } > <div><Card card={card}/></div></td>)
    }</tr>);
    return <div>
      <table>
        <tbody>{cardsRendered}</tbody>
      </table>
      <div>
        <div>
          <p>No. of clicks:<b>{this.state.clickCount}</b>
          </p>
        </div>
        <button onClick={() => this.restartGame()}>RESET</button>
      </div>
    </div>
  }
}



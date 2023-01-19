require 'pry'

class TicTacToe
    WIN_COMBINATIONS = [
        [0,1,2], # Top row
        [3,4,5],  # Middle row
        [6,7,8],  # et cetera, creating a nested array for each win combination
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
    ]

    def initialize
        @board = [" "," "," "," "," "," "," "," "," "]
    end

    def display_board
        puts "#{@board[0]} | #{@board[1]} | #{@board[2]} | #{@board[3]} | #{@board[4]} | #{@board[5]} | #{@board[6]} | #{@board[7]} | #{@board[8]}\n ---------"
    end

    def input_to_index input
        input.to_i - 1
    end

    def move index, token='X'
        @board[index] = token
    end

    def position_taken? index
        @board[index] != " "
    end

    def valid_move? index
        case index
        when 0..8
            !position_taken?(index)
        else
            false
        end
    end

    def turn_count
        @board.filter{|p| p != " "}.length
    end

    def current_player
        turn_count.even? ? 'X' : 'O'
    end

    def turn
        input = input_to_index(gets)
        if valid_move?(input)
            move(input, current_player)
            display_board
        else    
            puts "Not valid move"
            turn
        end
    end
end

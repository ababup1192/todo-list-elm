module Main exposing (Model, Msg(..), init, main, update, view)

import Browser
import Html exposing (Html, a, div, h1, img, input, p, s, text)
import Html.Attributes exposing (class, src, type_)



---- MODEL ----


type alias Model =
    { listItems : List Task }


init : () -> ( Model, Cmd Msg )
init _ =
    ( { listItems =
            [ UncheckedTask "todo"
            , UncheckedTask "todo"
            , UncheckedTask "todo"
            , CheckedTask "todo"
            ]
      }
    , Cmd.none
    )


type alias TaskContent =
    String


type Task
    = UncheckedTask TaskContent
    | CheckedTask TaskContent



---- UPDATE ----


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view { listItems } =
    div [ class "view-todo" ] <|
        [ p [] [ text "Todo List" ]
        ]
            ++ List.map task2View listItems


task2View : Task -> Html Msg
task2View task =
    case task of
        UncheckedTask content ->
            taskView content

        CheckedTask content ->
            checkedTaskView content


checkedTaskView : String -> Html Msg
checkedTaskView task =
    div [ class "todo" ]
        [ input [ type_ "checkbox" ]
            []
        , p []
            [ s []
                [ text task ]
            ]
        , a [ class "delete" ]
            [ text "x" ]
        ]


taskView : String -> Html Msg
taskView task =
    div [ class "todo" ]
        [ input [ type_ "checkbox" ]
            []
        , p []
            [ text task ]
        ]


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


main =
    Browser.element
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }

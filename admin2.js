$(document).ready(() => {
  let _global_flows = [];
  // start
  document.getElementById("start").addEventListener("click", () => {
    $.ajax({
      url: `http://localhost:1880/flow`,
      type: "post",
      data: JSON.stringify({
        id: "",
        label: "Flow added via request",
        nodes: [],
        configs: [],
      }),
      processData: true,
      contentType: "application/json",
    })
      .then((resp) => {
        _global_flows.push(resp);
        //
        document.getElementById(
          "req_flows"
        ).innerHTML += `<option value='${resp.id}'>${resp.id}</option>`;
        //
        document.getElementById(
          "output"
        ).innerHTML += `<p>Flow added | id => ${resp.id}</p>`;
        //
        $.ajax({
          url: `http://localhost:1880/flow/${resp.id}`,
          type: "get",
          // processData: true,
          // contentType: "application/json",
        })
          .then((resp_2) => {
            console.log(resp_2);
            _global_flows[_global_flows.length - 1] = resp_2;
            //
            let magicObject = _global_flows[_global_flows.length - 1];
            //
            const ID_s = {
              inject_1: randomId(resp.id),
              mqtt_out_1: randomId(resp.id),
            };
            //
            magicObject.nodes = [
              JSON.parse(`{
                    "id": "${ID_s.inject_1}",
                    "type": "inject",
                    "z": "${resp.id}",
                    "props": [
                      {
                        "p": "payload"
                      },
                      {
                        "p": "topic",
                        "vt": "str"
                      }
                    ],
                    "repeat": "1",
                    "once": true,
                    "onceDelay": "1",
                    "payloadType": "date",
                    "x": 100,
                    "y": 100,
                    "wires": [
                      [
                        "${ID_s.mqtt_out_1}"
                      ]
                    ]
                  }`),
              {
                id: ID_s.mqtt_out_1,
                type: "mqtt out",
                z: resp.id,
                topic: "hmm/test3",
                qos: "",
                retain: "",
                broker: "6ca842f1.31428c",
                x: "200",
                y: "100",
              },
            ];
            //
            $.ajax({
              url: `http://localhost:1880/flow/${resp.id}`,
              type: "put",
              data: JSON.stringify(magicObject),
              processData: true,
              contentType: "application/json",
            })
              .then((resp_3) => {
                document.getElementById(
                  "output"
                ).innerHTML += `<p>Flow updated | id => ${resp_3.id}</p>`;
                //
              })
              .fail((resp_3) => {
                console.log(resp_3);
                const errorLog = JSON.parse(resp_3.responseText);
                document.getElementById(
                  "output"
                ).innerHTML += `<p>${errorLog.code} : ${errorLog.message}</p>`;
              });
          })
          .fail((resp_2) => {
            console.log(resp_2);
            const errorLog = JSON.parse(resp_2.responseText);
            document.getElementById(
              "output"
            ).innerHTML += `<p>${errorLog.code} : ${errorLog.message}</p>`;
          });
      })
      .fail((resp) => {
        // resolve(errorhandler(resp.status));
        console.log(resp);
        const errorLog = JSON.parse(resp.responseText);
        document.getElementById(
          "output"
        ).innerHTML += `<p>${errorLog.code} : ${errorLog.message}</p>`;
      });

    //
    /*$.post('http://localhost:1880/flow',{
            id:'',
            label:"Flow added via request",
            nodes:[],
            configs:[]
        },(resp)=>{
            console.log(resp);
        });*/
  });
  // stop
  document.getElementById("stop").addEventListener("click", () => {
    if (document.getElementById("req_flows").length > 0) {
      const dlt_flow = document.getElementById("req_flows").options[
        document.getElementById("req_flows").selectedIndex
      ].value;
      //
      $.ajax({
        url: `http://localhost:1880/flow/${dlt_flow}`,
        type: "delete",
      })
        .then((resp) => {
          document
            .getElementById("req_flows")
            .children[
              document.getElementById("req_flows").selectedIndex
            ].remove();
          //
          document.getElementById(
            "output"
          ).innerHTML += `<p>Flow deleted | id => ${dlt_flow}</p>`;
          //
        })
        .fail((resp) => {});
    }
  });
});
//
function randomId(source) {
  return source + Math.floor(Math.random() * 10000000);
}

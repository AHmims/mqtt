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
// contribution 0
// [{ data: { bc: "", oxy: "", temp: "" }, date: "" }];
// [{ data: { bc: '60', oxy: '20', temp: '35.5' }, date: '2020-12-12 04:23' }]
// "{'records':[{'data':{'bc':'60','oxy':'20','temp':'35.5'},'date':'2020-12-12 04:23'}, {'data':{'bc':'60','oxy':'20','temp':'35.5'},'date':'2020-12-12 04:23'}],'mac':'6E-0E-95-27-13-3E'}"
// "{'records':[{'data':{'bc':'','oxy':'','temp':''},'date':''}],'mac':''}"
// "{'records':[{'data':{'bc':'','oxy':'','temp':''},'date':''}],'bracelet':'', 'broker':''}"
// "{'bracelet':'6E-0E-95-27-13-3E', 'broker':'0B-88-A4-66-0E-A0', 'records':[{'data':{'bc':'60','oxy':'20','temp':'35.5'},'date':'2020-12-12 04:23'}, {'data':{'bc':'60','oxy':'20','temp':'35.5'},'date':'2020-12-12 04:23'}]}"
// 
// "{'bracelet_mac' : '', 'broker_mac' : ''}"

// "{'bracelet' : '6E-0E-95-27-13-3E', 'broker' : '0B-88-A4-66-0E-A0'}"

// "{'bracelet' : '6E-0E-95-27-13-3E', 'broker' : '0B-88-A4-66-0E-A0'}"
// 
// 
// ERROR FORMAT =>{"code":"br_na_brace","user":"6E-0E-95-27-13-3","date":"2020-10-13 17:14:05","broker":"10"}
// SELECT DISTINCT SUM(`compteurZoneLog`) AS timeSpent FROM `zoneLog` WHERE TIMESTAMPDIFF(MINUTE, dateZoneLog, now()) <= 15 AND idPersonnel IN (SELECT idPersonnel FROM personnel WHERE macBracelet = '6E-0E-95-27-13-3E') AND idBroker IN (SELECT idbroker FROM broker WHERE idZone = 3) ORDER BY dateZoneLog DESC
// 
// convergance data format => "{'broker' : '', 'data' : [{'distance' : '', 'date' : '', 'bracelet_1' : '', 'bracelet_2' : ''}]}"

// "{'broker' : '0B-88-A4-66-0E-A0', 'data' : [{'distance' : 10, 'date' : '2020-10-10 10:10:10', 'bracelet_1' : '66-68-7C-6B-58-8F', 'bracelet_2' : '6E-0E-95-27-13-3E'}, {'distance' : 10, 'date' : '2020-10-10 10:10:14', 'bracelet_1' : '6E-0E-95-27-13-3E', 'bracelet_2' : '66-68-7C-6B-58-8F'}, {'distance' : 10, 'date' : '2020-10-10 10:10:10', 'bracelet_1' : '66-68-7C-6B-58-8F', 'bracelet_2' : '17-DE-36-70-58-A9'}]}"
// "{'broker' : '0B-88-A4-66-0E-A0', 'data' : [{'distance' : '0.50', 'date' : '2020-12-12 07:07:07', 'bracelet_1' : '66-68-7C-6B-58-8F', 'bracelet_2' : '17-DE-36-70-58-A9'},{'distance' : '1', 'date' : '2020-12-12 07:07:07', 'bracelet_1' : '66-68-7C-6B-58-8F', 'bracelet_2' : '6E-0E-95-27-13-3E'}]}"

// {broker : '', bracelet : '', convergance : [{distance : '', date : '', bracelet_1 : '', bracelet_2 : ''}], record : [data: {bc: '', oxy: '', temp: ''}, date: ''}]}
// "{'broker' : '0B-88-A4-66-0E-A0', 'bracelet' : '66-68-7C-6B-58-8F', 'convergence' : [{'distance' : '0.50', 'date' : '2020-12-12 07:07:07', 'bracelet_1' : '66-68-7C-6B-58-8F', 'bracelet_2' : '17-DE-36-70-58-A9'},{'distance' : '1', 'date' : '2020-12-12 07:07:07', 'bracelet_1' : '66-68-7C-6B-58-8F', 'bracelet_2' : '6E-0E-95-27-13-3E'}], 'record' : [{'data': {'bc': '10', 'oxy': '10', 'temp': '10'}, 'date': '2020-10-10 10:10:10'},{'data': {'bc': '10', 'oxy': '10', 'temp': '10'}, 'date': '2020-12-12 12:12:12'}]}"
// 
"{'bracelet_mac' : '17-DE-36-70-58-A9', 'broker_mac' : 'FF-CC-67-DE-1E-A0', 'parent_mac' : 'C8-5B-47-4A-75-61'}"
"{'bracelet_mac' : '17-DE-36-70-58-A9', 'broker_mac' : 'A9-D3-D9-DB-BA-47', 'parent_mac' : 'C8-5B-47-4A-75-61'}"

-h localhost -t bracelet/queue_room/send/10 -m "{'bracelet_mac' : '17-DE-36-70-58-A9', 'broker_mac' : 'FF-CC-67-DE-1E-A0', 'parent_mac' : 'C8-5B-47-4A-75-61'}"
-h localhost -t bracelet/queue_room/send/10 -m "{'bracelet_mac' : '17-DE-36-70-58-A9', 'broker_mac' : 'A9-D3-D9-DB-BA-47', 'parent_mac' : 'C8-5B-47-4A-75-61'}"


document.getElementById("depos").innerHTML += nignig.innerHTML;
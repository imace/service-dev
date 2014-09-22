//package com.sonymobile.china.statusmachine;
//
//import java.util.HashMap;
//import java.util.Map;
//
//import android.service.textservice.SpellCheckerService.Session;
//
//public class VoiceController {
//	public final static int INIT_STATUE = 0;
//	
//	public final static int IDLE_STATE = INIT_STATUE+1;
//
//    // private final static int MSG_EXCHANGE_INTERVAL = 10000;
//
//    public final static int RECOGNISE_STATE = IDLE_STATE + 1;
//
//    /*
//     * As selector in the Handover process
//     */
//    public final static int SELECTOR_MODE = RECOGNISE_STATE + 1;
//
//	
//	class StateHandlerFactory {
//
//        private final Map<Integer, StateHandler> StateHandlerMap = new HashMap<Integer, StateHandler>();
//
//        private void init() {
//            StateHandlerMap.put(IDLE_STATE, new IdleState());
//            StateHandlerMap.put(PREPARE_CAPABILITY_STATE, new PrepareCapability());  
//            StateHandlerMap.put(WAITING_FOR_PUSH_STATE, new WaitForPushState());
//        }
//
//        public StateHandlerFactory() {
//            init();
//        }
//
//        public StateHandler getStateHandler(int state) {
//            return StateHandlerMap.get(state);
//        }
//    }
//}
//
//
//interface StateHandler {
//
//    public void EntryState(Session session) throws NfcHandoverException;
//
//    public void leaveState(Session session) throws NfcHandoverException;
//
//    public Session execute(Session session) throws NfcHandoverException;
//}
//
//
